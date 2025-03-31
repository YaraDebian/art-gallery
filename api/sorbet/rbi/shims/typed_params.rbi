# typed: strict
# frozen_string_literal: true

module TypedParams
  extend T::Sig
  extend T::Helpers

  sig { params(struct_class: T.class_of(T::Struct)).returns(T.class_of(T::Struct)) }
  def self.[](struct_class)
    struct_class
  end

  class << self
    extend T::Sig

    sig { params(struct_class: T.class_of(T::Struct)).returns(T.class_of(T::Struct)) }
    def [](struct_class)
      struct_class
    end
  end
end 