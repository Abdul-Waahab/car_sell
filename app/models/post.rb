# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :pictures
  has_many :favourites, dependent: :destroy

  include PgSearch::Model
  multisearchable against: [:car_make, :city, :engine_type, :engine_capacity, :assembly_type, :color,
                            :transmission_type]

  multisearchable against: [:car_make, :city, :price, :engine_type, :transmission_type, :color, :milage,
                            :engine_capacity, :assembly_type]

  CITY = [%w[Lahore lahore], %w[Karachi karachi], %w[Islamabad islamabad], %w[Quetta quetta],
          %w[Rawalpindi rawalpindi]].freeze
  CAR_MAKE = [%w[Suzuki suzuki], %w[Toyota toyota], %w[honda honda], ['BMW ', 'bmw']].freeze
  ENGINE_TYPE = [%w[Petrol petrol], %w[Diesel diesel], %w[Hybrid hybrid]].freeze
  TRANSMISSION_TYPE = [%w[Automatic automatic], %w[Manual manual]].freeze
  COLOR = [%w[Black black], %w[White white], %w[Gray gray], %w[Silver silver], %w[Red red]].freeze
  ASSEMBLY_TYPE = [%w[Local local], %w[Imported imported]].freeze
  ENGINE_CAPACITY = [['800 CC', '800 cc'], ['1300 CC', '1300 cc'], ['1800 CC', '1800 cc']].freeze
  MILAGE = [%w[10 10], %w[12 12], %w[15 15], %w[18 18]].freeze
end
