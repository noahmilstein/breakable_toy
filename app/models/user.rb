class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :phone, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :zip, presence: true
  validates :seeking_coach, presence: true
  validates :accept_email, presence: true
  validates :accept_phone, presence: true

  STATES = [
    [ "AL" , "AL" ],
    [ "AK" , "AK" ],
    [ "AZ" , "AZ" ],
    [ "AR" , "AR" ],
    [ "CA" , "CA" ],
    [ "CO" , "CO" ],
    [ "CT" , "CT" ],
    [ "DC" , "DC" ],
    [ "DE" , "DE" ],
    [ "FL" , "FL" ],
    [ "GA" , "GA" ],
    [ "HI" , "HI" ],
    [ "ID" , "ID" ],
    [ "IL" , "IL" ],
    [ "IN" , "IN" ],
    [ "IA" , "IA" ],
    [ "KS" , "KS" ],
    [ "KY" , "KY" ],
    [ "LA" , "LA" ],
    [ "ME" , "ME" ],
    [ "MA" , "MA" ],
    [ "MI" , "MI" ],
    [ "MN" , "MN" ],
    [ "MO" , "MO" ],
    [ "MS" , "MS" ],
    [ "MT" , "MT" ],
    [ "NE" , "NE" ],
    [ "NV" , "NV" ],
    [ "NH" , "NH" ],
    [ "NJ" , "NJ" ],
    [ "NM" , "NM" ],
    [ "NY" , "NY" ],
    [ "NC" , "NC" ],
    [ "ND" , "ND" ],
    [ "OH" , "OH" ],
    [ "OK" , "OK" ],
    [ "OR" , "OR" ],
    [ "PA" , "PA" ],
    [ "RI" , "RI" ],
    [ "SC" , "SC" ],
    [ "SD" , "SD" ],
    [ "TN" , "TN" ],
    [ "TX" , "TX" ],
    [ "UT" , "UT" ],
    [ "VA" , "VA" ],
    [ "VT" , "VT" ],
    [ "WA" , "WA" ],
    [ "WI" , "WI" ],
    [ "WV" , "WV" ],
    [ "WY" , "WY" ]
  ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
