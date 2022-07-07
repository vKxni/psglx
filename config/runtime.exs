import Config

# develope mode while production isn't ready
if Config.config_env() == :dev do
  DotenvParser.load_file(".env")
end

# define the token for the discord api wrapper
config :nostrum,
  token: System.get_env("TOKEN")

# for development mode; local slash commands
config :psglx,
  env: Config.config_env(),
  GUILD_ID: System.get_env("GUILD_ID")
