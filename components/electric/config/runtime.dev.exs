import Config

config :logger, level: :debug

auth_provider = System.get_env("AUTH_MODE", "secure") |> Electric.Satellite.Auth.build_provider!()
config :electric, Electric.Satellite.Auth, provider: auth_provider

config :electric, Electric.Replication.Connectors,
  postgres_1: [
    producer: Electric.Replication.Postgres.LogicalReplicationProducer,
    connection: [
      host: ~c"localhost",
      port: 54321,
      database: ~c"electric",
      username: ~c"electric",
      password: ~c"password",
      replication: ~c"database",
      ssl: false
    ],
    replication: [
      electric_connection: [
        host: "host.docker.internal",
        port: 5433,
        dbname: "test"
      ]
    ]
  ]

config :electric, Electric.Replication.OffsetStorage, file: "./offset_storage_data.dev.dat"

config :electric, Electric.Postgres.Proxy, port: 65432

# add this capture_mode configuration to the proxy to initialise then injector
# in passthrough mode if you want to introspect the message flow between a
# client and the database.
# config :electric, Electric.Postgres.Proxy.Handler,
#   injector: [capture_mode: Electric.Postgres.Proxy.Injector.Capture.Transparent]
