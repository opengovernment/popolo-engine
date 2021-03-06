module Popolo
  # A relationship between a person and an organization.
  class Membership
    include Mongoid::Document
    include Mongoid::Timestamps

    # The person who is a party to the relationship.
    belongs_to :person, index: true, class_name: 'Popolo::Person'
    # The organization that is a party to the relationship.
    belongs_to :organization, index: true, class_name: 'Popolo::Organization'
    # The post held by the person in the organization through this membership.
    belongs_to :post, index: true, class_name: 'Popolo::Post'
    # Means of contacting the person who is a party to the relationship.
    embeds_many :contact_details, as: :contactable, class_name: 'Popolo::ContactDetail'
    # URLs to documents about the membership.
    embeds_many :links, as: :linkable, class_name: 'Popolo::Link'
    # URLs to source documents about the membership.
    embeds_many :sources, as: :linkable, class_name: 'Popolo::Link'

    # A label describing the membership.
    field :label, type: String
    # The role that the person fulfills in the organization.
    field :role, type: String
    # The date on which the relationship began.
    field :start_date, type: String
    # The date on which the relationship ended.
    field :end_date, type: String

    validates_presence_of :organization_id, :person_id
    validates_format_of :start_date, with: /\A\d{4}(-\d{2}){0,2}\z/, allow_blank: true
    validates_format_of :end_date, with: /\A\d{4}(-\d{2}){0,2}\z/, allow_blank: true
  end
end
