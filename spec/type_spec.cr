require "./spec_helper"

describe Type do
  describe "#effectiveness_against" do
    it "supports not very effective" do
      Type::Fire.effectiveness_against({Type::Water})
        .should eq TypeChart::Effectiveness::Weak
    end

    it "supports super effective" do
      Type::Water.effectiveness_against({Type::Fire})
        .should eq TypeChart::Effectiveness::Strong
    end

    it "supports 0 effectiveness" do
      Type::Fighting.effectiveness_against({Type::Ghost})
        .should eq TypeChart::Effectiveness::None
    end

    it "defaults to unchanged effectiveness" do
      Type::Fire.effectiveness_against({Type::Fighting})
        .should eq TypeChart::Effectiveness::Regular
    end

    it "is not effective by combining duplicate types" do
      Type::Fire.effectiveness_against({Type::Water, Type::Water})
        .should eq TypeChart::Effectiveness::Weak
    end

    it "can combine a strong type and a weak type to regular effectiveness" do
      Type::Fire.effectiveness_against({Type::Water, Type::Grass})
        .should eq TypeChart::Effectiveness::Regular
    end

    it "does not combine 0 effectiveness" do
      Type::Fighting.effectiveness_against({Type::Dark, Type::Ghost})
        .should eq TypeChart::Effectiveness::None
    end
  end
end
