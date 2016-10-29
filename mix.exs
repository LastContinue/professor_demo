defmodule ProfDemo.Mixfile do
  use Mix.Project

  def project do
    [app: :prof_demo,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :slack_professor],
     mod: {ProfDemo, []}]
  end

  defp deps do
   [{:slack_professor, github: "lastcontinue/slack_professor"}]
  end
end
