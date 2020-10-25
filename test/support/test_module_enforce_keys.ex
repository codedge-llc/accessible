defmodule Accessible.TestModuleEnforceKeys do
  @moduledoc false

  @enforce_keys [:key_1, :key_2]
  defstruct key_1: 1234, key_2: true

  use Accessible
end
