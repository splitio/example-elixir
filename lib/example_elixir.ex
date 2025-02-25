defmodule ExampleElixir do
  @moduledoc """
  Documentation for `ExampleElixir` Application
  """

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Split, address: "./splitd.sock"},
      {Plug.Cowboy, scheme: :http, plug: ExampleElixir.Router, options: [port: 8080]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExampleElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Hello world.

  ## Examples

      iex> ExampleElixir.hello()
      :world

  """
  def hello do
    :world
  end
end
