# frozen_string_literal: true

module BiopsyQuestionnairesHelper
  def antibiotic_groups
    AppendixAntibiotic::GROUPS.collect do |group|
      {
        t("shared.appendix_antibiotic.#{group}.group") => AppendixAntibiotic.send(group.to_s.pluralize.to_s).keys.map do |k|
                                                            [t("shared.appendix_antibiotic.#{group}.#{k}"), k.to_s]
                                                          end
      }
    end.inject(:merge)
  end
end
