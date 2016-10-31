defmodule ProfDemo do
  use Application

  def start(_type, _args) do
   import Supervisor.Spec, warn: false

   children = [
    supervisor(ProfDemo.Bot.Supervisor,[]),
    worker(ProfDemo.Bot.Kickstarter,[])
   ]

   opts = [strategy: :one_for_all, name: ProfDemo.Supervisor]
   Supervisor.start_link(children, opts)
  end

end
