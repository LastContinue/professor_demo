# Slack Professor Demo

This is a demo implementation of [SlackProfessor](https://github.com/LastContinue/slack_professor) (and by extension, [Pokerap](https://github.com/LastContinue/pokerap))

Since this is just a demo, I went ahead and filled in all of the config variables you can use
for the respective dependencies. See them in `/config/confix.exs`. You'll notice `config :prof_demo, tokens:`
is set to read from System vars. Details below on how that needs to be setup.

Enjoy!

## Usage  

1. clone this repo
1. set `SLACKBOT_TOKENS` ENV variable (`export SLACKBOT_TOKENS="token1, token2, tokenX"`), using a comma
to separate the tokens.
1. `mix run -e ProfDemo.start_bots --no-halt`, or `iex -S mix` then run `ProfDemo.start_bots` if you want to play along
