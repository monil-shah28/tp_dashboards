view: employee {
  sql_table_name: public.employee ;;
  drill_fields: [employee_id]

  dimension: employee_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."employee_id" ;;
  }
  dimension: base_location {
    type: number
    sql: ${TABLE}."base_location" ;;
  }
  dimension: company_name {
    type: string
    sql: ${TABLE}."company_name" ;;
  }
  dimension: crest_experience {
    type: number
    sql: ${TABLE}."crest_experience" ;;
  }
  dimension_group: date_of_joining {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date_of_joining" ;;
  }
  dimension_group: date_of_leaving {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."date_of_leaving" ;;
  }
  dimension: designation_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."designation_id" ;;
  }
  dimension: direct_manager_id {
    type: number
    sql: ${TABLE}."direct_manager_id" ;;
  }
  dimension: email_id {
    type: string
    sql: ${TABLE}."email_id" ;;
  }
  dimension: employee_name {
    type: string
    sql: ${TABLE}."employee_name" ;;
  }
  dimension: geographical_calendar_id {
    type: number
    sql: ${TABLE}."geographical_calendar_id" ;;
  }
  dimension: grade {
    type: number
    sql: ${TABLE}."grade" ;;
  }
  dimension: hrms_business_unit_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."hrms_business_unit_id" ;;
  }
  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }
  dimension_group: internship {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."internship_date" ;;
  }
  dimension: performance_rating {
    type: string
    sql: ${TABLE}."performance_rating" ;;
  }
  dimension: role_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."role_id" ;;
  }
  dimension: skills_with_rating {
    type: string
    sql: ${TABLE}."skills_with_rating" ;;
  }
  dimension: status {
    type: yesno
    sql: ${TABLE}."status" ;;
  }
  dimension: total_experience {
    type: number
    sql: ${TABLE}."total_experience" ;;
  }
  dimension: username {
    type: string
    sql: ${TABLE}."username" ;;
  }
  measure: count {
    type: count
    drill_fields: [employee_id, employee_name]
    link: {
      label: "Look this event in chronicle"
      url: "https://www.google.com/"
    }
  }
  # parameter: time_poc {
  #   type: string
  #   default_value: "Last7Days"
  #   allowed_value: {
  #     label: "Today"
  #     value: "Today"
  #   }
  #   allowed_value: {
  #     label: "Yesterday"
  #     value: "Yesterday"
  #   }
  #   allowed_value: {
  #     label: "Last 7 days"
  #     value: "Last7days"
  #   }
  #   allowed_value: {
  #     label: "Last 30 days"
  #     value: "Last30days"
  #   }
  #   allowed_value: {
  #     label: "Last 90 days"
  #     value: "Last90days"
  #   }
  # }
  # filter: time_poc {
  #   type: date
  # }
  # dimension: time_poc_dimension {
  #   type: date
  #   sql: (
  #         DATE(
  #               CASE
  #                 WHEN  {%parameter time_poc%} = 'Last30days' THEN  now() - interval '30 day'
  #                 WHEN {%parameter time_poc%} = 'Last90days' THEN  now() - interval '90 day'
  #                 ELSE NULL
  #               END
  #             )
  #         );;
  #   convert_tz: no
  # }

  # dimension: ok {
  #   sql:  {%parameter time_poc%} ;;
  # }
  # dimension: dynamic_timeframe {
  #   sql:  {% if ${ok} == "Last30days" %} ${date_of_joining_date}
  #     {% elsif ${ok} == "Last90days" %} ${date_of_joining_month}
  #     {% else %} ${date_of_joining_month}
  #     {% endif %} ;;
  # }


    # dimension: dynamic_timeframe {
  #   type: time
  #   sql: CASE
  #         WHEN {% parameter time_poc %} = 'Today' THEN ${date_of_joining_date}
  #         WHEN {% parameter time_poc %} = 'Last7days' THEN ${date_of_joining_month} :: DATE
  #         WHEN {% parameter time_poc %} = 'Last90days' THEN ${date_of_joining_month} ::DATE
  #         ELSE ${date_of_joining_month} :: DATE
  #       END ;;
  # }

  # dimension: dynamic_timeframe {
  #   type: string
  #   sql: CASE
  #                 WHEN  parameter_.time_poc  = '15days' THEN  CAST(${date_of_joining_date} AS VARCHAR(10))
  #                 WHEN parameter_.time_poc = '30days' THEN CAST(${date_of_joining_month} AS VARCHAR(10))
  #                 ELSE CAST(${date_of_joining_date} AS VARCHAR(10))
  #               END ;;
  # }
  # ----- Sets of fields for drilling ------
  # set: detail {
  #   fields: [

  # ]
  # }

}
