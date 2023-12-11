
view: ld_count_bu_wise {
  derived_table: {
    sql: SELECT count(*) count, jiraBU.business_unit FROM 
      public.learning_development as LD 
      join public.jira_business_unit as jiraBU on LD.jira_business_unit_id = jiraBU.id
      group by jira_business_unit_id,business_unit ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}."count" ;;
  }

  dimension: business_unit {
    type: string
    sql: ${TABLE}."business_unit" ;;
  }

  set: detail {
    fields: [
        count_,
	business_unit
    ]
  }
}
