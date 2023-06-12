class Helper
  def headers(*args)
    [
      #"user_id",
      "loan_usage",
      "reus",
      "application_risk_score",
      "industry_category",
      "industry_subcategory",
      "kcash_payment_date",
      "kcash_balance",
      "kcash_amount",
      "compliance_record_date",
      "external_id",
      "risk_result",
      "reject_reason",
      "kcash_debt_amount",
      "application_date",
      "last_update",
      "due_date",
      "product_id",
      "state",
      "home_city",
      "my_favorite_category_emarsys",
      #"my_preferences", #Contract all coloumns
      #"my_preference_foods_drinks",
      #"my_preference_car",
      #"my_preference_beauty_and_wellness",
      #"my_preference_education_and_culture",
      #"my_preference_electronics",
      #"my_preference_events",
      #"my_preference_home_and_furniture",
      #"my_preference_jewelry",
      #"my_preference_toys_and_games",
      #"my_preference_marketplaces",
      #"my_preference_pets",
      #"my_preference_fashion_and_accessories",
      #"my_preference_health_and_Fitness",
      #"my_preference_online_streaming_services",
      #"my_preference_transport_travel_agencies",
      #"my_preference_surprise_shops",
      "mobile_sms_opt_in",
      "cliente_recurrente",
      "application_status",
      "promotions_and_discounts_emarsys",
      #"promotions_and_discounts_food_and_drinks",
      #"promotions_and_discounts_car",
      #"promotions_and_discounts_beauty_and_wellness",
      #"promotions_and_discounts_education_and_culture",
      #"promotions_and_discounts_electronics",
      #"promotions_and_discounts_events",
      #"promotions_and_discounts_home_and_furniture",
      #"promotions_and_discounts_jewelry",
      #"promotions_and_discounts_toys_games",
      #"promotions_and_discounts_marketplaces",
      #"promotions_and_discounts_pets",
      #"promotions_and_discounts_fashion_accessories",
      #"promotions_and_discounts_health_fitness",
      #"promotions_and_discounts_online_streaming_services",
      #"promotions_and_discounts_transport_and_travel_agencies",
      #"promotions_and_discounts_surprise_shops",
      "approved_days",
      "approved_money",
      "categorias_favoritas_hotsale",
      "job_title",
      "first_name",
      "last_name",
      "email",
      "phone",
      "gender",
      "dob",
      "email_subscribe",
      "valid_email_emarsys",
      "first_registration_date_emarsys",
      #"was_migrate"
      ]
  end

  def map_row(row)
    [
      #row["user_id"],
      row["loan_usage"],
      row["reus"],
      row["application_risk_score"],
      row["industry_category"],
      row["industry_subcategory"],
      row["kcash_payment_date"],
      row["kcash_balance"],
      row["kcash_amount"],
      row["compliance_record_date"],
      row["user_id_kpay"],
      row["risk_result"],
      row["reject_reason"],
      row["kcash_debt_amount"],
      row["application_date"],
      row["last_update"],
      row["due_date"],
      row["product_id"],
      row["state"],
      row["home_city"],
      row["my_favorite_category"],
      #calculate_my_preference(row),
      #row["my_preference_foods_drinks"],
      #row["my_preference_car"],
      #row["my_preference_beauty_and_wellness"],
      #row["my_preference_education_and_culture"],
      #row["my_preference_electronics"],
      #row["my_preference_events"],
      #row["my_preference_home_and_furniture"],
      #row["my_preference_jewelry"],
      #row["my_preference_toys_and_games"],
      #row["my_preference_marketplaces"],
      #row["my_preference_pets"],
      #row["my_preference_fashion_and_accessories"],
      #row["my_preference_health_and_Fitness"],
      #row["my_preference_online_streaming_services"],
      #row["my_preference_transport_travel_agencies"],
      #row["my_preference_surprise_shops"],
      row["mobile_sms_opt_in"],
      row["cliente_recurrente"],
      row["application_status"],
      calculate_promotions_and_discounts(row),
      #row["promotions_and_discounts_food_and_drinks"],
      #row["promotions_and_discounts_car"],
      #row["promotions_and_discounts_beauty_and_wellness"],
      #row["promotions_and_discounts_education_and_culture"],
      #row["promotions_and_discounts_electronics"],
      #row["promotions_and_discounts_events"],
      #row["promotions_and_discounts_home_and_furniture"],
      #row["promotions_and_discounts_jewelry"],
      #row["promotions_and_discounts_toys_games"],
      #row["promotions_and_discounts_marketplaces"],
      #row["promotions_and_discounts_pets"],
      #row["promotions_and_discounts_fashion_accessories"],
      #row["promotions_and_discounts_health_fitness"],
      #row["promotions_and_discounts_online_streaming_services"],
      #row["promotions_and_discounts_transport_and_travel_agencies"],
      #row["promotions_and_discounts_surprise_shops"],
      row["approved_days"],
      row["approved_money"],
      calculate_categorias_favoritas_hotsale(row),
      row["job_title"],
      row["first_name"],
      row["last_name"],
      row["email"],
      row["phone_mobile"],
      calculate_gender(row["gender"]),
      row["dob"],
      calculate_email_subscribe(row["email_subscribe"]),
      row["valid_email"],
      row["first_registration_date"],
     # row["was_migrate"],
    ]
  end

  def calculate_gender(gender)
    genders = {
      "Mujer" => "F",
      "Hombre" => "M"
    }
    genders.fetch(gender, "O")
  end

  def calculate_email_subscribe(opt_in)
    map = {
      "Verdadero" => "subscribed",
      "Falso" => "unsubscribed"
    }
    map.fetch(opt_in, "opted_in")
  end

  def calculate_my_preference(row)
    "#{row["my_preference_foods_drinks"]}
#{row["my_preference_car"]}
#{row["my_preference_beauty_and_wellness"]}
#{row["my_preference_education_and_culture"]}
#{row["my_preference_electronics"]}
#{row["my_preference_events"]}
#{row["my_preference_home_and_furniture"]}
#{row["my_preference_jewelry"]}
#{row["my_preference_toys_and_games"]}
#{row["my_preference_marketplaces"]}
#{row["my_preference_pets"]}
#{row["my_preference_fashion_and_accessories"]}
#{row["my_preference_health_and_Fitness"]}
#{row["my_preference_online_streaming_services"]}
#{row["my_preference_transport_travel_agencies"]}
#{row["my_preference_surprise_shops"]}
"
  end

  def calculate_promotions_and_discounts(row)
    "#{parser_promotions_text(row["promotions_and_discounts_food_and_drinks"], "Alimentos y Bebidas")}#{parser_promotions_text(row["promotions_and_discounts_car"], "Auto")}#{parser_promotions_text(row["promotions_and_discounts_beauty_and_wellness"], "Belleza y bienestar")}#{parser_promotions_text(row["promotions_and_discounts_education_and_culture"], "Educaión y cultura")}#{parser_promotions_text(row["promotions_and_discounts_electronics"], "Electrónica")}#{parser_promotions_text(row["promotions_and_discounts_events"], "Eventos")}#{parser_promotions_text(row["promotions_and_discounts_home_and_furniture"], "Hogar y Muebles")}#{parser_promotions_text(row["promotions_and_discounts_jewelry"], "Joyería")}#{parser_promotions_text(row["promotions_and_discounts_toys_games"], "Juguetes y juegos")}#{parser_promotions_text(row["promotions_and_discounts_marketplaces"], "Marketplaces")}#{parser_promotions_text(row["promotions_and_discounts_pets"], "Mascotas")}#{parser_promotions_text(row["promotions_and_discounts_fashion_accessories"], "Moda y Accesorios")}#{parser_promotions_text(row["promotions_and_discounts_health_fitness"], "Salud y estado físico")}#{parser_promotions_text(row["promotions_and_discounts_online_streaming_services"], "Servicios en línea y transmisión")}#{parser_promotions_text(row["promotions_and_discounts_transport_and_travel_agencies"], "Transporte y agencias de viaje")}#{parser_promotions_text(row["promotions_and_discounts_surprise_shops"], "Tiendas sorpresa")}".chop
  end

  def calculate_categorias_favoritas_hotsale(row)
    parser_promotions_text(row["wants_promotios_beauty"], "Belleza") +
    parser_promotions_text(row["wants_promotios_footwaer"], "Calzado") +
    parser_promotions_text(row["wants_promotios_education"], "Educación") +
    parser_promotions_text(row["wants_promotios_entertainment"], "Entretenimiento") +
    parser_promotions_text(row["wants_promotios_home"], "Hogar") +
    parser_promotions_text(row["wants_promotios_pets"], "Mascotas") +
    parser_promotions_text(row["wants_promotios_accessories"], "Ropa y accesorios") +
    parser_promotions_text(row["wants_promotios_health_fitness"], "Salud y cuidado físico") +
    parser_promotions_text(row["wants_promotios_stores_walmart_lino"], "Tiendas en línea (Walmart y Linio)") +
    parser_promotions_text(row["wants_promotios_travel_and_trasnport"], "Viajes y transporte") +
    parser_promotions_text(row["wants_promotios_suprise"], "¡Sorpréndeme!")
  end

  def parser_promotions_text(value, text)
    if(value == "1")
      "#{text};"
    else
      ""
    end
  end
end
