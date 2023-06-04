SELECT p.id               as project_id,
       p.title,
       bi.financial_year,
       pm.title           as procurement_method,


       pde.title as pde,
       pde.category as pde_category,
       bi.id as bid_invitation_id,
       bi.display_of_beb_notice_date,
       bi.estimated_amount as market_price,
       bi.bid_submission_deadline_date,
       bi.bid_evaluation_start_date,
       bi.bid_evaluation_end_date,
       bi.contract_award_date as planned_award_date,
       bi.contract_signature_date as planned_signature_date,
       bi.initiation_date,
       bi.invitation_to_bid_date,
       bs.nationality as provider_nationality,
       bs.nationality_status as provider_nationality_status,
       bs.estimated_amount as bid_price,
       bs.provider_name,
       bs.read_out_price as award_price,
       pp.budget_amount,
       pp.project_start_date,
       fs.title as funding_source,
       bs.id as bid_id,
       bs.is_beb as is_winner


FROM projects p
         left JOIN project_types pt on pt.id = p.project_type_id
         left JOIN project_sectors ps on ps.id = p.sector_id
         left join bid_invitations bi on bi.project_id = p.id
         left join pdes pde on pde.id = bi.pde_id
         left join procurement_methods pm on pm.id = bi.procurement_method_id

left join bid_submissions bs on bi.id = bs.bid_invitation_id
left join project_preparations pp on p.id = pp.project_id
left join funding_sources fs on pp.funding_source_id = fs.id
group by  bid_id