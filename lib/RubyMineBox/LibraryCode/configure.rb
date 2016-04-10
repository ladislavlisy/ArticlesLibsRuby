class Configure
  EMPTY_PENDING_NAMES = []

  def self.pending_article_names1(code1)
    [ code1 ]
  end

  def self.pending_article_names2(code1, code2)
    [ code1, code2 ]
  end

  def self.pending_article_names3(code1, code2, code3)
    [ code1, code2, code3 ]
  end

  def self.pending_article_names4(code1, code2, code3, code4)
    [ code1, code2, code3, code4 ]
  end

  def self.pending_article_names5(code1, code2, code3, code4, code5)
    [ code1, code2, code3, code4, code5 ]
  end

  def self.pending_article_names9(code1, code2, code3, code4, code5, code6, code7, code8, code9)
    [ code1, code2, code3, code4, code5, code6, code7, code8, code9 ]
  end

  def self.configure_contract_term_articles
    config_category = ProcessCategory::CATEGORY_TERMS
    article_array = [
        Article.new(ConfigArticleCode::ARTICLE_CONTRACT_EMPL_TERM, config_category,
                    Configure::EMPTY_PENDING_NAMES),
        Article.new(ConfigArticleCode::ARTICLE_POSITION_EMPL_TERM, config_category,
                    pending_article_names1(
                        ConfigArticleCode::ARTICLE_CONTRACT_EMPL_TERM))
    ]
    article_array
  end

  def self.configure_position_time_articles
    config_category = ProcessCategory::CATEGORY_TERMS
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_SCHEDULE_WORK, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_POSITION_EMPL_TERM
                    )),
        new Article(ConfigArticleCode::ARTICLE_TIMESHEET_SCHEDULE, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_SCHEDULE_WORK
                    )),
        new Article(ConfigArticleCode::ARTICLE_TIMESHEET_WORKING, config_category,
                    PendingArticleNames2(
                        ConfigArticleCode::ARTICLE_TIMESHEET_SCHEDULE,
                        ConfigArticleCode::ARTICLE_POSITION_EMPL_TERM
                    )),
        new Article(ConfigArticleCode::ARTICLE_TIMESHEET_ABSENCE, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TIMESHEET_WORKING
                    )),
        new Article(ConfigArticleCode::ARTICLE_TIMEHOURS_WORKING, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TIMESHEET_WORKING
                    )),
        new Article(ConfigArticleCode::ARTICLE_TIMEHOURS_ABSENCE, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TIMESHEET_ABSENCE
                    ))
    ]
    article_array
  end

  def self.configure_gross_income_articles
    config_category = ProcessCategory::CATEGORY_AMOUNT
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_SALARY_BASE, config_category,
                    PendingArticleNames2(
                        ConfigArticleCode::ARTICLE_TIMEHOURS_WORKING,
                        ConfigArticleCode::ARTICLE_TIMEHOURS_ABSENCE
                    ))
    ]
    article_array
  end

  def self.configure_total_income_articles
    config_category = ProcessCategory::CATEGORY_FINAL
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_INCOME_GROSS, config_category,
                    EMPTY_PENDING_NAMES),
        new Article(ConfigArticleCode::ARTICLE_INCOME_NETTO, config_category,
                    PendingArticleNames9(
                        ConfigArticleCode::ARTICLE_INCOME_GROSS,
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_TOTAL,
                        ConfigArticleCode::ARTICLE_TAXING_BONUS_CHILD,
                        ConfigArticleCode::ARTICLE_TAXING_WITHHOLD_GENERAL,
                        ConfigArticleCode::ARTICLE_HEALTH_EMPLOYEE_GENERAL,
                        ConfigArticleCode::ARTICLE_HEALTH_EMPLOYEE_MANDATORY,
                        ConfigArticleCode::ARTICLE_SOCIAL_EMPLOYEE_GENERAL,
                        ConfigArticleCode::ARTICLE_SOCIAL_EMPLOYEE_PENSION,
                        ConfigArticleCode::ARTICLE_GARANT_EMPLOYEE_PENSION
                    ))
    ]
    article_array
  end

  def self.configure_netto_deducts_articles
    config_category = ProcessCategory::CATEGORY_NETTO
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_TAXING_ADVANCES_TOTAL, config_category,
                    PendingArticleNames2(
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_GENERAL,
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_SOLIDARY
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_ADVANCES_GENERAL, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_BASIS_GENERAL
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_ADVANCES_SOLIDARY, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_BASIS_SOLIDARY
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_WITHHOLD_GENERAL, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_WITHHOLD_BASIS_GENERAL
                    )),
        new Article(ConfigArticleCode::ARTICLE_HEALTH_EMPLOYEE_GENERAL, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_HEALTH_BASIS_GENERAL
                    )),
        new Article(ConfigArticleCode::ARTICLE_HEALTH_EMPLOYEE_MANDATORY, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_HEALTH_BASIS_MANDATORY
                    )),
        new Article(ConfigArticleCode::ARTICLE_SOCIAL_EMPLOYEE_GENERAL, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_SOCIAL_BASIS_GENERAL
                    )),
        new Article(ConfigArticleCode::ARTICLE_SOCIAL_EMPLOYEE_PENSION, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_SOCIAL_BASIS_PENSION
                    )),
        new Article(ConfigArticleCode::ARTICLE_GARANT_EMPLOYEE_PENSION, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_GARANT_BASIS_PENSION
                    ))
    ]
    article_array
  end

  def self.configure_basis_health_articles
    config_category = ProcessCategory::CATEGORY_NETTO
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_HEALTH_INCOME_SUBJECT, config_category,
                    EMPTY_PENDING_NAMES),
        new Article(ConfigArticleCode::ARTICLE_HEALTH_INCOME_PARTICIP, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_HEALTH_INCOME_SUBJECT
                    )),
        new Article(ConfigArticleCode::ARTICLE_HEALTH_BASIS_GENERAL, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_HEALTH_INCOME_PARTICIP
                    )),
        new Article(ConfigArticleCode::ARTICLE_HEALTH_BASIS_MANDATORY, config_category,
                    PendingArticleNames2(
                        ConfigArticleCode::ARTICLE_HEALTH_BASIS_GENERAL,
                        ConfigArticleCode::ARTICLE_HEALTH_INCOME_PARTICIP
                    )),
        new Article(ConfigArticleCode::ARTICLE_HEALTH_BASIS_LEGALCAP, config_category,
                    PendingArticleNames2(
                        ConfigArticleCode::ARTICLE_HEALTH_BASIS_GENERAL,
                        ConfigArticleCode::ARTICLE_HEALTH_INCOME_PARTICIP
                    ))
    ]
    article_array
  end

  def self.configure_basis_social_articles
    config_category = ProcessCategory::CATEGORY_NETTO
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_SOCIAL_INCOME_SUBJECT, config_category,
                    EMPTY_PENDING_NAMES),
        new Article(ConfigArticleCode::ARTICLE_SOCIAL_INCOME_PARTICIP, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_SOCIAL_INCOME_SUBJECT
                    )),
        new Article(ConfigArticleCode::ARTICLE_SOCIAL_BASIS_GENERAL, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_SOCIAL_INCOME_PARTICIP
                    )),
        new Article(ConfigArticleCode::ARTICLE_SOCIAL_BASIS_PENSION, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_SOCIAL_INCOME_PARTICIP
                    )),
        new Article(ConfigArticleCode::ARTICLE_SOCIAL_BASIS_LEGALCAP, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_SOCIAL_INCOME_PARTICIP
                    ))
    ]
    article_array
  end

  def self.configure_basis_garant_articles
    config_category = ProcessCategory::CATEGORY_NETTO
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_GARANT_INCOME_SUBJECT, config_category,
                    EMPTY_PENDING_NAMES),
        new Article(ConfigArticleCode::ARTICLE_GARANT_INCOME_PARTICIP, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_GARANT_INCOME_SUBJECT
                    )),
        new Article(ConfigArticleCode::ARTICLE_GARANT_BASIS_PENSION, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_GARANT_INCOME_PARTICIP
                    )),
        new Article(ConfigArticleCode::ARTICLE_GARANT_BASIS_LEGALCAP, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_GARANT_INCOME_PARTICIP
                    ))
    ]
    article_array
  end

  def self.configure_basis_taxing_articles
    config_category = ProcessCategory::CATEGORY_NETTO
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_TAXING_INCOME_SUBJECT, config_category,
                    EMPTY_PENDING_NAMES),
        new Article(ConfigArticleCode::ARTICLE_TAXING_INCOME_HEALTH, config_category,
                    EMPTY_PENDING_NAMES),
        new Article(ConfigArticleCode::ARTICLE_TAXING_INCOME_SOCIAL, config_category,
                    EMPTY_PENDING_NAMES)
    ]
    article_array
  end

  def self.configure_basis_advances_articles
    config_category = ProcessCategory::CATEGORY_NETTO
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_TAXING_ADVANCES_INCOME, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_INCOME_SUBJECT
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_ADVANCES_HEALTH, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_INCOME_HEALTH
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_ADVANCES_SOCIAL, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_INCOME_SOCIAL
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_ADVANCES_BASIS_GENERAL, config_category,
                    PendingArticleNames3(
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_INCOME,
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_HEALTH,
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_SOCIAL
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_ADVANCES_BASIS_SOLIDARY, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_BASIS_GENERAL
                    ))
    ]
    article_array
  end

  def self.configure_basis_withhold_articles
    config_category = ProcessCategory::CATEGORY_NETTO
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_TAXING_WITHHOLD_INCOME, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_INCOME_SUBJECT
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_WITHHOLD_HEALTH, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_INCOME_HEALTH
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_WITHHOLD_SOCIAL, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_INCOME_SOCIAL
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_WITHHOLD_BASIS_GENERAL, config_category,
                    PendingArticleNames3(
                        ConfigArticleCode::ARTICLE_TAXING_WITHHOLD_INCOME,
                        ConfigArticleCode::ARTICLE_TAXING_WITHHOLD_HEALTH,
                        ConfigArticleCode::ARTICLE_TAXING_WITHHOLD_SOCIAL
                    ))
    ]
    article_array
  end

  def self.configure_allowance_taxis_articles
    config_category = ProcessCategory::CATEGORY_NETTO
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_TAXING_ALLOWANCE_PAYER, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_INCOME
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_ALLOWANCE_DISABILITY, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_INCOME
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_ALLOWANCE_STUDYING, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_INCOME
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_ALLOWANCE_CHILD, config_category,
                    PendingArticleNames1(
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_INCOME
                    ))
    ]
    article_array
  end

  def self.configure_rebate_taxis_articles
    config_category = ProcessCategory::CATEGORY_NETTO
    article_array = [
        new Article(ConfigArticleCode::ARTICLE_TAXING_REBATE_PAYER, config_category,
                    PendingArticleNames4(
                        ConfigArticleCode::ARTICLE_TAXING_ALLOWANCE_PAYER,
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_TOTAL,
                        ConfigArticleCode::ARTICLE_TAXING_ALLOWANCE_DISABILITY,
                        ConfigArticleCode::ARTICLE_TAXING_ALLOWANCE_STUDYING
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_REBATE_CHILD, config_category,
                    PendingArticleNames3(
                        ConfigArticleCode::ARTICLE_TAXING_ALLOWANCE_CHILD,
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_TOTAL,
                        ConfigArticleCode::ARTICLE_TAXING_REBATE_PAYER
                    )),
        new Article(ConfigArticleCode::ARTICLE_TAXING_BONUS_CHILD, config_category,
                    PendingArticleNames3(
                        ConfigArticleCode::ARTICLE_TAXING_ADVANCES_TOTAL,
                        ConfigArticleCode::ARTICLE_TAXING_REBATE_PAYER,
                        ConfigArticleCode::ARTICLE_TAXING_REBATE_CHILD
                    ))
    ]
    article_array
  end

  def self.configure_articles
    configure_contract_term_articles
  end
end
