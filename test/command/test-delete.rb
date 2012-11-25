# -*- coding: utf-8 -*-
#
# Copyright (C) 2012  Kouhei Sutou <kou@clear-code.com>
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

class DeleteCommandTest < Test::Unit::TestCase
  class CommandLineTest < self
    include GroongaCommandTestUtils::CommandLineCommandParser

    def test_ordered_arguments
      table  = "Users"
      key    = "Alice"
      id     = "29"
      filter = "age == 20"

      command = parse(table, key, id, filter)
      assert_instance_of(Groonga::Command::Delete, command)
      assert_equal({
                     :table  => table,
                     :key    => key,
                     :id     => id,
                     :filter => filter,
                   },
                   command.arguments)
    end

    private
    def parse(*arguments)
      super("delete", arguments, :output_type => false)
    end
  end
end
