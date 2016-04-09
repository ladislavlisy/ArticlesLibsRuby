class Configure
  EMPTY_PENDING_NAMES = []

  def self.pending_article_names1(code1)
    [code1]
  end

  def self.pending_article_names2(code1, code2)
    [code1, code2]
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

  def self.configure_articles()
    configure_contract_term_articles
  end
end
