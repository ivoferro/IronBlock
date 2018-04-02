defmodule Core.Block do

  alias Core.Block

  defstruct [
    hash: nil,
    previousHash: nil,
    timestamp: nil,
    transaction: nil,
    nounce: nil
  ]

  def generate_genesis_block do
    block = %Block{
      timestamp: DateTime.utc_now(),
      nounce: 0
    }

    %{block | hash: generate_hash(block)}
  end

  defp generate_hash(%Block{} = block) do
    block_string = block
    |> inspect()

    :crypto.hash(:md5, block_string)
    |> Base.encode16()
  end

end
