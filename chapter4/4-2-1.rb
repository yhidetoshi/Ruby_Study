=begin
module Sweet
  def self.lot
    %w(hoge huga apple mac windows).sample
  end
end

p Sweet.lot
=end

module Sweet
 module Chocolate
 end

 class Brownie
 end
end

p Sweet::Chocolate
p Sweet::Brownie
