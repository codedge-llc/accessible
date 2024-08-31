defmodule AccessibleTest do
  use ExUnit.Case
  doctest Accessible

  alias Accessible.{TestModule, TestModuleEnforceKeys}

  describe "normal struct" do
    test "enables map accessor syntax" do
      assert %TestModule{}[:key_1] == 1234
    end

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

  describe "struct with enforce keys" do
    test "enables map accessor syntax" do
      data = %TestModuleEnforceKeys{key_1: :example, key_2: 1234}
      assert data[:key_1] == :example
      assert data[:key_2] == 1234
    end

    test "fetch/2 returns value for given key" do
      data = %TestModuleEnforceKeys{key_1: :example, key_2: 1234}
      assert Access.fetch(data, :key_1) == {:ok, :example}
    end

    test "fetch/2 returns :error if key does not exist" do
      data = %TestModuleEnforceKeys{key_1: :example, key_2: 1234}
      assert Access.fetch(data, :invalid) == :error
    end

    test "get/3 returns value for given key" do
      data = %TestModuleEnforceKeys{key_1: :example, key_2: 1234}
      assert Access.get(data, :key_1, :default) == :example
    end

    test "get/3 returns default value if key does not exist" do
      data = %TestModuleEnforceKeys{key_1: :example, key_2: 1234}
      assert Access.get(data, :invalid, :default) == :default
    end
  end
end
