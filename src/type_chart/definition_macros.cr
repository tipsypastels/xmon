module TypeChart
  module DefinitionMacros
    private Strong  = 2_f32
    private Regular = 1_f32
    private Weak    = 0.5_f32
    private None    = 0_f32

    private macro def_effectiveness_category(base_type, subject_types, effectiveness)
      {% if subject_types %}
        {% for subject_type in subject_types %}
          @@chart[{Type::{{base_type}}, Type::{{subject_type}}}] = {{effectiveness}}
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
