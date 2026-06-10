require 'rails_helper'

# Model specs for the `generate_slug` callback on TasteParameter.
#
# TasteParameter drives the React finder's sliders (acidity, body,
# tannin, etc.). The serializer emits `id: taste_parameter.slug`, so
# the auto-slug has to be predictable across create and update.
RSpec.describe TasteParameter, type: :model do
  describe "#generate_slug callback" do
    context "when the label is blank" do
      it "leaves the slug nil" do
        tp = TasteParameter.new(label: "", low: "x", high: "y", help: "h")
        tp.valid?
        expect(tp.slug).to be_nil
      end
    end

    context "when the label is provided and the slug is blank" do
      it "parameterizes the label into the slug" do
        tp = TasteParameter.create!(label: "Acidity", low: "Soft", high: "Sharp", help: "Bright.")
        expect(tp.slug).to eq("acidity")
      end

      it "strips punctuation and downcases" do
        tp = TasteParameter.create!(label: "Alcohol %", low: "Low", high: "High", help: "Heat.")
        expect(tp.slug).to eq("alcohol")
      end
    end

    context "when the caller has already set a slug" do
      it "does not overwrite the explicit slug" do
        tp = TasteParameter.create!(slug: "acid", label: "Acidity", low: "Soft", high: "Sharp", help: "x")
        expect(tp.slug).to eq("acid")
      end
    end

    context "when the desired slug is already taken" do
      it "appends a numeric suffix" do
        TasteParameter.create!(slug: "body", label: "Body Original", low: "a", high: "b", help: "x")
        second = TasteParameter.create!(label: "Body", low: "a", high: "b", help: "x")
        expect(second.slug).to eq("body-2")
      end

      it "increments past existing -2, -3..." do
        TasteParameter.create!(slug: "tan", label: "A", low: "a", high: "b", help: "x")
        TasteParameter.create!(slug: "tan-2", label: "B", low: "a", high: "b", help: "x")
        TasteParameter.create!(slug: "tan-3", label: "C", low: "a", high: "b", help: "x")
        fourth = TasteParameter.create!(label: "Tan", low: "a", high: "b", help: "x")
        expect(fourth.slug).to eq("tan-4")
      end

      it "ignores the current record on update" do
        tp = TasteParameter.create!(label: "Sweet", low: "Dry", high: "Sweet", help: "x")
        expect(tp.slug).to eq("sweet")
        tp.update!(help: "updated help text")
        expect(tp.reload.slug).to eq("sweet")
      end
    end

    context "on update" do
      it "does not regenerate the slug when the label changes" do
        tp = TasteParameter.create!(label: "Original", low: "a", high: "b", help: "x")
        original_slug = tp.slug
        tp.update!(label: "Renamed")
        expect(tp.reload.slug).to eq(original_slug)
      end
    end
  end
end
