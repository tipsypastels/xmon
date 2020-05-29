module TypeChart
  module DefinitionMacros
    private macro def_effectiveness_category(base_type, subject_types, effectiveness)
      {% if subject_types %}
        {% for subject_type in subject_types %}
          @@chart[{Type::{{base_type}}, Type::{{subject_type}}}] = Effectiveness::{{effectiveness}}
        {% end %}
      {% end %}
    end

    private macro def_effectiveness(base_type, *, strong_against = nil, weak_against = nil, none_against = nil)
      def_effectiveness_category({{base_type}}, {{strong_against}}, Strong)
      def_effectiveness_category({{base_type}}, {{weak_against}}, Weak)
      def_effectiveness_category({{base_type}}, {{none_against}}, None)
    end
  end
end
