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

require "groonga/command/base"

module Groonga
  module Command
    class Select < Base
      Command.register("select", self)

      def sortby
        @arguments["sortby"]
      end

      def scorer
        @arguments["scorer"]
      end

      def query
        @arguments["query"]
      end

      def filter
        @arguments["filter"]
      end

      def conditions
        @conditions ||= filter.split(/(?:&&|&!|\|\|)/).collect do |condition|
          condition = condition.strip
          condition = condition.gsub(/\A[\s\(]*/, '')
          condition = condition.gsub(/[\s\)]*\z/, '') unless /\(/ =~ condition
          condition
        end
      end

      def drilldowns
        @drilldowns ||= (@arguments["drilldown"] || "").split(/\s*,\s*/)
      end

      def output_columns
        @arguments["output_columns"]
      end
    end
  end
end
