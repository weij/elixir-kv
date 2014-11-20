defmodule KV.BucketTest do
  use ExUnit.Case, async: true
  
  setup do
    {:ok, pid} = KV.Bucket.start_link() 
    {:ok, bucket: pid}
  end

  test "store values by key", %{bucket: pid} do

    assert KV.Bucket.get(pid, :zhi) == nil

    KV.Bucket.put(pid, :zhi, 2)
    assert KV.Bucket.get(pid, :zhi) == 2
  end

  test "delete values by key", %{bucket: pid} do
     KV.Bucket.put(pid, :zhi, 2)
     assert KV.Bucket.get(pid, :zhi) == 2   

     assert KV.Bucket.delete(pid, :zhi) == 2
     assert KV.Bucket.get(pid, :zhi) == nil
  end

  test "delete values by key if the key NOT exists", %{bucket: pid} do
     KV.Bucket.put(pid, :zhi, 2)
     assert KV.Bucket.get(pid, :zhi) == 2   

     assert KV.Bucket.delete(pid, :hao) == nil
  end  
end