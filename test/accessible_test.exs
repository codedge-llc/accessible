defmodule AccessibleTest do
  use ExUnit.Case
  doctest Accessible

  alias Accessible.TestModule

  test "fetch/2 returns value for given key" do
    assert Access.fetch(%TestModule{}, :key_1) == {:ok, 1234}
  end

  test "fetch/2 returns :error if key does not exist" do
    assert Access.fetch(%TestModule{}, :invalid) == :error
  end

  test "get/3 returns value for given key" do
    assert Access.get(%TestModule{}, :key_1, :default) == 1234
  end

  test "get/3 returns default value if key does not exist" do
    assert Access.get(%TestModule{}, :invalid, :default) == :default
  end
end
