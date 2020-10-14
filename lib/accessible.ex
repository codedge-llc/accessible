defmodule Accessible do
  @moduledoc false

  defmacro __using__(_) do
    quote location: :keep do
      @behaviour Access

      defdelegate fetch(term, key), to: Map
      defdelegate get_and_update(term, key, fun), to: Map
      defdelegate pop(data, key), to: Map
    end
  end
end
