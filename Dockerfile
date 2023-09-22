FROM hasura/graphql-engine:v2.33.4

# Enable the console
ENV HASURA_GRAPHQL_ENABLE_CONSOLE=true

# Enable debugging mode. It should be disabled in production.
ENV HASURA_GRAPHQL_DEV_MODE=true
ENV HASURA_GRAPHQL_ENABLE_ALLOWLIST=true
# Heroku only allows to install extensions in the heroku_ext schema
ENV HASURA_GRAPHQL_METADATA_DATABASE_EXTENSIONS_SCHEMA=public

# Heroku hobby tier PG has few limitations including 20 max connections
# https://devcenter.heroku.com/articles/heroku-postgres-plans#hobby-tier
ENV HASURA_GRAPHQL_PG_CONNECTIONS=15
# Set custom environment variables
ENV MY_CUSTOM_ENV_VARIABLE=value
# Set the port you want to use
ENV HASURA_GRAPHQL_SERVER_PORT=8080

# Use the CMD instruction to run the Hasura service
CMD ["graphql-engine", "serve"]
