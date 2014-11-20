defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  test "store values by key" do
    {:ok, pid} = KV.Bucket.start_link()
    assert KV.Bucket.get(pid, :zhi) == nil

    KV.Bucket.put(pid, :zhi, 2)
    assert KV.Bucket.get(pid, :zhi) == 2
  end
end