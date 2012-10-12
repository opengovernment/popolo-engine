# Turtle document:
#
#     <http://example.com/people/47cc67093475061e3d95369d.ttl>
#       v:hasAddress [
#         a v:Address;
#         rdfs:label "10-123 1/2 Main St\n1/2 Main St SE\nMontreal QC  H3Z 2Y7";
#         v:context [ rdfs:label "Constituency address" ]
#       ];
#       v:hasTelephone [
#         a v:Telephone;
#         v:telephone "tel:+1-800-555-0100;ext=555";
#         v:context [ a v:Voice ]
#       ];
#       v:hasTelephone [
#         a v:Telephone;
#         v:telephone "tel:+1-800-555-0199";
#         v:context [ a v:Fax ]
#       ].
#
# @see http://tools.ietf.org/html/rfc6350
# @see http://tools.ietf.org/html/rfc3966
module Popolo
  # An office including postal address and telephone and facsimile numbers.
  class Address
    include Mongoid::Document

    embedded_in :addressable, polymorphic: true

    # A human-readable identifier for the address, e.g. "Constituency address".
    field :name, type: String
    # The postal address, in which each line is an element in the array.
    field :address, type: Array
    # The telephone number.
    field :tel, type: Integer
    # The facsimile number.
    field :fax, type: Integer

    validates_presence_of :name, :address
  end
end
