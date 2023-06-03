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
       beb.created_at
FROM projects p
         left JOIN project_types pt on pt.id = p.project_type_id
         left JOIN project_sectors ps on ps.id = p.sector_id
         left join bid_invitations bi on bi.project_id = p.id
         left join pdes pde on pde.id = bi.pde_id
         left join procurement_methods pm on pm.id = bi.procurement_method_id
         LEFT join best_evaluated_bidders beb on beb.bid_invitation_id = bi.id;