defmodule UUID_GEN.MixProject do
  use Mix.Project

  def project do
    [
      app: :uuid_gen,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: [main_module: UUID_GEN, name: "uuid"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: []
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :uuid, "~> 1.1" }
    ]
  end
end
