# Copyright (C) 2015  Kouhei Sutou <kou@clear-code.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

class PluginRegisterCommandTest < Test::Unit::TestCase
  private
  def plugin_register_command(pair_arguments={}, ordered_arguments=[])
    Groonga::Command::PluginRegister.new(pair_arguments,
                                         ordered_arguments)
  end

  class ConstructorTest < self
    def test_ordered_arguments
      name = "query_expanders/tsv"

      ordered_arguments = [
        name,
      ]
      command = plugin_register_command({}, ordered_arguments)
      assert_equal({
                     :name => name,
                   },
                   command.arguments)
    end
  end

  class NameTest < self
    def test_reader
      command = plugin_register_command(:name => "query_expanders/tsv")
      assert_equal("query_expanders/tsv", command.name)
    end
  end
end
