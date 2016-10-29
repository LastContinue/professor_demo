defmodule ProfDemo do
  use Application

  def start(_type, _args) do
   import Supervisor.Spec, warn: false

   children = [
    supervisor(ProfDemo.Bot.Supervisor,[]),
   ]

   opts = [strategy: :rest_for_one, name: ProfDemo.Supervisor]
   Supervisor.start_link(children, opts)
  end

  def start_bots do
    spawn_bots = fn
      (tokens) when is_bitstring(tokens) ->
      tokens
      |> String.strip 
      |> String.split(",")
      |> Enum.each(&ProfDemo.Bot.Supervisor.start_bot(&1))
      (tokens) when is_nil(tokens) -> {:error, "no tokens specified"}
      (_) -> {:error, "tokens must be string"} #not sure how this could happen
    end
    spawn_bots.(Application.get_env(:prof_demo, :tokens))
  end

end
