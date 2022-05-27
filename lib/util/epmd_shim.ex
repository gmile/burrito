defmodule Burrito.Util.EpmdShim do
  @moduledoc """
  This is a simple shim to stub out methods for EMPD-less Burrito apps.
  To use this module, create a file `rel/vm.args.eex` in your project, and specify the arguments:

  `-start_epmd false -epmd_module Elixir.Burrito.Util.EpmdShim`

  This will prevent epmd from starting, and also shim out any epmd regsitration calls to this module.
  **NOTE: This means you cannot use Erlang Node Distribution at all!**

  This module is intended to be used when you want epmd to be disabled at all levels.
  (For example: if you are building a local-only CLI app.)

  Thanks to: https://www.erlang-solutions.com/blog/erlang-and-elixir-distribution-without-epmd/
  """

  def start_link(), do: :ignore

  def register_node(_name, _port) do
    {:ok, :rand.uniform(10)}
  end

  def register_node(name, port, _) do
    register_node(name, port)
  end

  def port_please() do
    port = 1234
    version = 5
    {port, port, version}
  end

  def names(_), do: {:error, :address}
end
