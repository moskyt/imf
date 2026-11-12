require "minitest/autorun"

require_relative "../lib/mcnp_output_file"

class TestMcnp < Minitest::Test
  def test_read
    fn = File.expand_path("data/c1_1o", __dir__)
    o = MCNPOutputFile.new(fn)
    assert_in_delta 1.00353, o.keff
  end
end

