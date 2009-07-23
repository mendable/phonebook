Factory.define :company do |c|
  c.name "ACME Corp"
end

Factory.define :contact do |c|
  c.lastname "Foobar"
  c.firstname "Bob"
  c.phone "00 123 123456"
  c.email "foo@bar.com"
  
  c.association :company
end
