num_array = [4, 4, 2, 3]
#num_array = [4, 4, 2, 3, 2.0, 2.5]
#p num_array.select{|v| v.even?} 
#p num_array.select{|v| v.odd?}
#p num_array.reject{|v| v.even?}

#p num_array.take(3)
#p num_array.drop(3)
#puts num_array.group_by{|val| val.class}
p num_array.partition{|n| n.even?}

