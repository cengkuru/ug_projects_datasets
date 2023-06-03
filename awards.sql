SELECT p.id               as project_id,
       p.title,
       bi.financial_year,
       pm.title           as procurement_method,
       beb.id             as best_evaluated_bidder_id,
       beb.date_of_commencement_of_evaluation,
       beb.bid_invitation_id,
       beb.date_of_combined_evaluation_report,
       beb.date_of_approval_of_final_evaluation_report_by_cc,
       beb.date_of_display,
       beb.bid_submission_id,
       beb.contract_price as award_amount,
       beb.created_at,
       beb.beb_expiry_date,

       pde.title as pde,
       pde.category as pde_category,
       bi.display_of_beb_notice_date,
       bi.estimated_amount as market_price,
       bi.bid_submission_deadline_date,
       bi.bid_evaluation_start_date,
       bi.bid_evaluation_end_date,
       bi.contract_award_date as planned_award_date,
       bi.contract_signature_date as planned_signature_date,
       bi.initiation_date,
       bi.invitation_to_bid_date,
       bs.nationality,
       bs.estimated_amount as bid_price,
       bs.provider_name,
       bs.read_out_price as award_price,
       pp.budget_amount,
       pp.project_start_date,
       fs.title as funding_source

FROM projects p
         left JOIN project_types pt on pt.id = p.project_type_id
         left JOIN project_sectors ps on ps.id = p.sector_id
         left join bid_invitations bi on bi.project_id = p.id
         left join pdes pde on pde.id = bi.pde_id
         left join procurement_methods pm on pm.id = bi.procurement_method_id
         LEFT join best_evaluated_bidders beb on beb.bid_invitation_id = bi.id
left join bid_submissions bs on bi.id = bs.bid_invitation_id
left join project_preparations pp on p.id = pp.project_id
left join funding_sources fs on pp.funding_source_id = fs.id
where beb.id is not null
group by  best_evaluated_bidder_id