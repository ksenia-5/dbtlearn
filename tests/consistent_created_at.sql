-- test that no review is written before listing created
SELECT
    fr.listing_id,
    fr.review_date,
    dl.created_at
FROM 
    {{ ref('fct_reviews') }} fr
LEFT JOIN 
    {{ ref('dim_listings') }} dl
ON fr.listing_id = dl.listing_id
WHERE review_date < created_at