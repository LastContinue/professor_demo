use Mix.Config

#All :slack_professor values are set to the
# default values except for cache_duration, for demo purposes
config :slack_professor, timeout: 30000
config :slack_professor, pool_size: 5
config :slack_professor, pool_overflow: 1
config :slack_professor, cache_duration: 3600

#Even for demo, it's good to set recv_timeout
config :pokerap, language: "en" #defaults to "en"
config :pokerap, timeout: 10000 #defaults 8000
config :pokerap, recv_timeout: 20000  #defaults to 5000

config :prof_demo, tokens: System.get_env("SLACKBOT_TOKENS")
