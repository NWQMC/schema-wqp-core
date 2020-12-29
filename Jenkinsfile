pipeline {
  agent {
    node {
      label 'team:iow'
    }
  }
  stages {
    stage('Set Build Description') {
      steps {
        script {
          currentBuild.description = "Deploy to ${env.DEPLOY_STAGE} - Liquibase: ${env.RUN_LIQUIBASE} - GEO: ${env.RUN_GEO_REFERENCE}"
        }
      }
    }
    stage('Clean Workspace') {
      steps {
        cleanWs()
      }
    }
    stage('Git Clone') {
      steps {
        checkout([
          $class: 'GitSCM',
          branches: [[name: '*/master']],
          doGenerateSubmoduleConfigurations: false,
          extensions: [],
          submoduleCfg: [],
          userRemoteConfigs: [[
            credentialsId: 'CIDA-Jenkins-GitHub',
            url: 'https://github.com/NWQMC/schema-wqp-core.git'
          ]]
        ])
      }
    }
    stage('Download liquibase jar') {
      steps {
        sh '''mkdir $WORKSPACE/wqp_core
          /usr/local/bin/aws s3 cp s3://owi-common-resources/resources/InstallFiles/liquibase/liquibase-$LIQUIBASE_VERSION.tar.gz $WORKSPACE/wqp_core/liquibase.tar.gz
          /usr/bin/tar xzf $WORKSPACE/wqp_core/liquibase.tar.gz --overwrite -C $WORKSPACE/wqp_core
          /usr/local/bin/aws s3 cp s3://owi-common-resources/resources/InstallFiles/postgres/$JDBC_JAR $WORKSPACE/wqp_core/lib/$JDBC_JAR
        '''
      }
    }
    stage('Run liquibase') {
      steps {
        script {
        def mappedStage = ""
        def deployStage = "$DEPLOY_STAGE"
        println(deployStage)
        switch(deployStage) {
          case "PROD-EXTERNAL":
            mappedStage = "legacy-production-external"
            break
          case "QA":
            mappedStage = "legacy-qa"
            break
          case "TEST":
            mappedStage = "legacy-test"
            break
          default:
            mappedStage = "development"
        }
        env.MAPPED_STAGE = mappedStage
        def dbAdminSecret = sh(script: '/usr/local/bin/aws secretsmanager get-secret-value --secret-id "/observations-db-$MAPPED_STAGE/$MAPPED_STAGE/rds-admin-password" --region "us-west-2"', returnStdout: true).trim()
          def secretsString = sh(script: '/usr/local/bin/aws ssm get-parameter --name "/aws/reference/secretsmanager/WQP-EXTERNAL-$DEPLOY_STAGE" --query "Parameter.Value" --with-decryption --output text --region "us-west-2"', returnStdout: true).trim()
          def secretsJson =  readJSON text: secretsString
          def dbAdminSecretJson = readJSON text: dbAdminSecret
          env.WQP_DATABASE_ADDRESS = secretsJson.DATABASE_ADDRESS
          env.WQP_DATABASE_NAME = secretsJson.DATABASE_NAME
          env.WQP_DB_OWNER_USERNAME = secretsJson.DB_OWNER_USERNAME
          env.WQP_DB_OWNER_PASSWORD = secretsJson.DB_OWNER_PASSWORD
          env.WQP_SCHEMA_NAME = secretsJson.WQP_SCHEMA_NAME
          env.WQP_SCHEMA_OWNER_USERNAME = secretsJson.WQP_SCHEMA_OWNER_USERNAME
          env.WQP_SCHEMA_OWNER_PASSWORD = secretsJson.WQP_SCHEMA_OWNER_PASSWORD
          env.WQP_SCHEMA_NAME = secretsJson.WQP_SCHEMA_NAME
          env.WQP_READ_ONLY_USERNAME = secretsJson.WQP_READ_ONLY_USERNAME
          env.WQP_READ_ONLY_PASSWORD = secretsJson.WQP_READ_ONLY_PASSWORD
          env.NWIS_SCHEMA_OWNER_USERNAME = secretsJson.NWIS_SCHEMA_OWNER_USERNAME
          env.NWIS_SCHEMA_OWNER_PASSWORD = secretsJson.NWIS_SCHEMA_OWNER_PASSWORD
          env.POSTGRES_PASSWORD = dbAdminSecretJson.SecretString
          env.ARTIFACTORY_INTERNAL_URL = secretsJson.ARTIFACTORY_INTERNAL_URL

          sh '''
          if [ $RUN_LIQUIBASE == true ];
          then
            export CONTEXTS=$CONTEXTS
            export LIQUIBASE_HOME=$WORKSPACE/wqp_core
            export LIQUIBASE_WORKSPACE_WQP=$WORKSPACE/liquibase/changeLogs

            chmod +x $WORKSPACE/liquibase/scripts/dbInit/z1_postgres_liquibase.sh
            chmod +x $WORKSPACE/liquibase/scripts/dbInit/z2_wqp_liquibase.sh
            $WORKSPACE/liquibase/scripts/dbInit/z1_postgres_liquibase.sh
            $WORKSPACE/liquibase/scripts/dbInit/z2_wqp_liquibase.sh
          fi
          '''
        }
      }
    }
    stage('Load Geo Reference') {
      steps {
        script {
          def secretsString = sh(script: '/usr/local/bin/aws ssm get-parameter --name "/aws/reference/secretsmanager/WQP-EXTERNAL-$DEPLOY_STAGE" --query "Parameter.Value" --with-decryption --output text --region "us-west-2"', returnStdout: true).trim()
          def secretsJson =  readJSON text: secretsString
          env.WQP_DATABASE_ADDRESS = secretsJson.DATABASE_ADDRESS
          env.WQP_DATABASE_NAME = secretsJson.DATABASE_NAME
          env.WQP_DB_OWNER_USERNAME = secretsJson.DB_OWNER_USERNAME
          env.WQP_DB_OWNER_PASSWORD = secretsJson.DB_OWNER_PASSWORD
          sh '''
          if [ $RUN_GEO_REFERENCE == true ];
          then

            mkdir $WORKSPACE/geo

            curl https://${ARTIFACTORY_INTERNAL_URL}/artifactory/wma-binaries/iow/wqp/countyGeom.tar.gz -Lo $WORKSPACE/geo/countyGeom.tar.gz
            /usr/bin/tar xzf $WORKSPACE/geo/countyGeom.tar.gz --overwrite -C $WORKSPACE/geo

            curl https://${ARTIFACTORY_INTERNAL_URL}/artifactory/wma-binaries/iow/wqp/hu12nhdplusv2.sql.tar.gz -Lo $WORKSPACE/geo/hu12nhdplusv2.sql.tar.gz
            /usr/bin/tar xzf $WORKSPACE/geo/hu12nhdplusv2.sql.tar.gz --overwrite -C $WORKSPACE/geo

            curl https://${ARTIFACTORY_INTERNAL_URL}/artifactory/wma-binaries/iow/wqp/huc8.tar.gz -Lo $WORKSPACE/geo/huc8.tar.gz
            /usr/bin/tar xzf $WORKSPACE/geo/huc8.tar.gz --overwrite -C $WORKSPACE/geo

            curl https://${ARTIFACTORY_INTERNAL_URL}/artifactory/wma-binaries/iow/wqp/states.tar.gz -Lo $WORKSPACE/geo/states.tar.gz
            /usr/bin/tar xzf $WORKSPACE/geo/states.tar.gz --overwrite -C $WORKSPACE/geo

            curl https://${ARTIFACTORY_INTERNAL_URL}/artifactory/wma-binaries/iow/wqp/usCounties.tar.gz -Lo $WORKSPACE/geo/usCounties.tar.gz
            /usr/bin/tar xzf $WORKSPACE/geo/usCounties.tar.gz --overwrite -C $WORKSPACE/geo

            curl https://${ARTIFACTORY_INTERNAL_URL}/artifactory/wma-binaries/iow/wqp/tl_2019_us_county.sql.tar.gz -Lo $WORKSPACE/geo/tl_2019_us_county.sql.tar.gz
            /usr/bin/tar xzf $WORKSPACE/geo/tl_2019_us_county.sql.tar.gz --overwrite -C $WORKSPACE/geo

            docker \
              run \
              -e "PGPASSWORD=$WQP_DB_OWNER_PASSWORD" \
              --rm \
              -v $WORKSPACE/geo:/usr/src/geo \
              postgres \
              psql -h ${WQP_DATABASE_ADDRESS} -U ${WQP_DB_OWNER_USERNAME} -d ${WQP_DATABASE_NAME} -f /usr/src/geo/COUNTY_GEOM_data.sql

            docker \
              run \
              -e "PGPASSWORD=$WQP_DB_OWNER_PASSWORD" \
              --rm \
              -v $WORKSPACE/geo:/usr/src/geo \
              postgres \
              psql -h ${WQP_DATABASE_ADDRESS} -U ${WQP_DB_OWNER_USERNAME} -d ${WQP_DATABASE_NAME} -f /usr/src/geo/hu12_nhdplusv2.sql

            docker \
              run \
              -e "PGPASSWORD=$WQP_DB_OWNER_PASSWORD" \
              --rm \
              -v $WORKSPACE/sql:/usr/src/sql \
              postgres \
              psql -h ${WQP_DATABASE_ADDRESS} -U ${WQP_DB_OWNER_USERNAME} -d ${WQP_DATABASE_NAME} -f /usr/src/sql/huc12_transform.sql

            docker \
              run \
              -e "PGPASSWORD=$WQP_DB_OWNER_PASSWORD" \
              --rm \
              -v $WORKSPACE/geo:/usr/src/geo \
              postgres \
              psql -h ${WQP_DATABASE_ADDRESS} -U ${WQP_DB_OWNER_USERNAME} -d ${WQP_DATABASE_NAME} -f /usr/src/geo/HUC8_CONUS_HI_AK_PR_DIS_data.sql

            docker \
              run \
              -e "PGPASSWORD=$WQP_DB_OWNER_PASSWORD" \
              --rm \
              -v $WORKSPACE/geo:/usr/src/geo \
              postgres \
              psql -h ${WQP_DATABASE_ADDRESS} -U ${WQP_DB_OWNER_USERNAME} -d ${WQP_DATABASE_NAME} -f /usr/src/geo/STATES_data.sql

            docker \
              run \
              -e "PGPASSWORD=$WQP_DB_OWNER_PASSWORD" \
              --rm \
              -v $WORKSPACE/geo:/usr/src/geo \
              postgres \
              psql -h ${WQP_DATABASE_ADDRESS} -U ${WQP_DB_OWNER_USERNAME} -d ${WQP_DATABASE_NAME} -f /usr/src/geo/US_COUNTIES_DIS_20121015_data.sql

            docker \
              run \
              -e "PGPASSWORD=$WQP_DB_OWNER_PASSWORD" \
              --rm \
              -v $WORKSPACE/geo:/usr/src/geo \
              postgres \
              psql -h ${WQP_DATABASE_ADDRESS} -U ${WQP_DB_OWNER_USERNAME} -d ${WQP_DATABASE_NAME} -f /usr/src/geo/tl_2019_us_county.sql

          fi
          '''
        }
      }
    }
  }
}
