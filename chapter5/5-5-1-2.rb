people = %w(Alice Bob Chalie)

p people.min_by{|s| s.length}
p people.max_by{|s| s.length}
p people.minmax_by{|s| s.length}

p people.sort
p people.sort {|a, b| a.length <=> b.length}
p people.sort_by {|name| name.length}

