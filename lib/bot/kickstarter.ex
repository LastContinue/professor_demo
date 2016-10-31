defmodule ProfDemo.Bot.Kickstarter do
  use GenServer

  def start_link() do
    :gen_server.start_link(__MODULE__, :ok, [])
  end

  def init(:ok) do
      {:ok, pids} = start_bots Application.get_env(:prof_demo, :tokens)
      {:ok, pids} 
  end

  defp start_bots(keys) when is_bitstring(keys) do
    pids = keys
    |> String.strip
    |> String.split(",")
    |> Enum.map(&start_bot(&1))
    {:ok, pids}
  end

  defp start_bots(keys) when is_nil(keys) do
    {:error, "no tokens specified"}
  end

  defp start_bot(key) do
    #don't really need the pattern match here, but good for safety
    {:ok, pid} = ProfDemo.Bot.Supervisor.start_bot(key)
    pid
  end

end
