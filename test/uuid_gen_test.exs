defmodule UUID_GENTest do
  use ExUnit.Case, async: true
  doctest UUID_GEN

  import ExUnit.CaptureIO

  test "no args" do
    assert UUID_GEN.process_args([], [], [])
  end

  test "version 1" do
    assert UUID_GEN.process_args([], ["1"], [])
  end

  test "version 4" do
    assert UUID_GEN.process_args([], ["4"], [])
  end

  test "version 3 dns" do
    assert UUID_GEN.process_args([dns: "example.com"], ["3"], []) == {:ok, "9073926b-929f-31c2-abc9-fad77ae3e8eb"}
  end

  test "version 3 dns hex" do
    assert UUID_GEN.process_args([dns: "example.com", hex: 1], ["3"], []) == {:ok, "9073926b929f31c2abc9fad77ae3e8eb"}
  end

  test "version 3 dns urn" do
    assert UUID_GEN.process_args([dns: "example.com", urn: 1], ["3"], []) == {:ok, "urn:uuid:9073926b-929f-31c2-abc9-fad77ae3e8eb"}
  end

  test "version 3 url" do
    assert capture_io(
      fn -> UUID_GEN.main(["3", "--url", "http://example.com"]) end
    ) == "d632b50c-7913-3137-ae9a-2d93f56e70d5\n"
  end

  test "version 5 dns" do
    assert capture_io(
      fn -> UUID_GEN.main(["5", "--dns", "example.com"]) end
    ) == "cfbff0d1-9375-5685-968c-48ce8b15ae17\n"
  end

  test "version 5 dns hex" do
    assert capture_io(
      fn -> UUID_GEN.main(["5", "--dns", "example.com", "--hex"]) end
    ) == "cfbff0d193755685968c48ce8b15ae17\n"
  end

  test "version 5 dns urn" do
    assert capture_io(
      fn -> UUID_GEN.main(["5", "--dns", "example.com", "--urn"]) end
    ) == "urn:uuid:cfbff0d1-9375-5685-968c-48ce8b15ae17\n"
  end

  test "version 5 url" do
    assert capture_io(
      fn -> UUID_GEN.main(["5", "--url", "example.com"]) end
    ) == "a5cf6e8e-4cfa-5f31-a804-6de6d1245e26\n"
  end

  test "usage" do
    assert UUID_GEN.process_args([help: true], [], [])
  end

  test "invalid option" do
    assert UUID_GEN.process_args([], [], [blah: "test"]) == {:err, "Argument blah is not recognized as a valid option."}
    assert UUID_GEN.process_args([dns: "example.com"], ["3"], [blah: "test"]) == {:err, "Argument blah is not recognized as a valid option."}
  end

  test "invalid version" do
    assert UUID_GEN.process_args([], ["2"], []) == {:err, "Unknown uuid version number 2."}
  end
end
