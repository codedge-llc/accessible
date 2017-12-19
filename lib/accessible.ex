defmodule Accessible do
  @moduledoc """
  Documentation for Accessible.
  """

  defmacro __using__(_) do
    quote location: :keep do
      @behaviour Access

      def thing do
        Enum.reduce(%__MODULE__{}, fn({k, _v}) -> k end)
      end

      def fetch(struct, key), do: Map.fetch(struct, key)

      def get(struct, key, default \\ nil) do
        case struct do
          %{^key => value} -> value
          _else -> default
        end
      end

      def put(struct, key, val) do
        if Map.has_key?(struct, key), do: Map.put(struct, key, val), else: struct
      end

      def delete(struct, key) do
        put(struct, key, %__MODULE__{}[key])
      end

      def get_and_update(struct, key, fun) when is_function(fun, 1) do
        current = get(struct, key)

        case fun.(current) do
          {get, update} ->
            {get, put(struct, key, update)}

          :pop ->
            {current, delete(struct, key)}

          other ->
            raise "the given function must return a two-element tuple or :pop, got: #{inspect(other)}"
        end
      end

      def pop(struct, key, default \\ nil) do
        val = get(struct, key, default)
        updated = delete(struct, key)
        {val, updated}
      end
    end
  end
end
