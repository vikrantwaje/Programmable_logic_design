set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|is_active_sample_count[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|is_active_line_count_f0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|is_active_line_count_f1[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|is_total_sample_count[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|is_total_line_count_f0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|is_total_line_count_f1[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|is_resolution_valid}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|is_stable}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|is_interlaced}]

set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:clear_overflow_sticky_sync|data_out_sync0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:*enable_resync_sync|data_out_sync0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:enable_sync|data_out_sync0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:overflow_sticky_sync|data_out_sync0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:update_sync|data_out_sync0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:*field_prediction_sync|data_out_sync0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:resolution_change_sync|data_out_sync0[*]}]

set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:refclk_divider_value_sync|data_out_sync0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:sof_sample_sync|data_out_sync0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:sof_line_sync|data_out_sync0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:sof_subsample_sync|data_out_sync0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:genlock_enable_sync|data_out_sync0[*]}]
set_false_path -to [get_keepers {*alt_vipcti130_Vid2IS:*|alt_vipcti130_common_sync:*vid_std_sync|data_out_sync0[*]}]

set_false_path -from [get_registers {*alt_vipcti*_Vid2IS:*|*_common_fifo:*dcfifo*delayed_wrptr_g[*]}] -to [get_registers {*alt_vipcti*_Vid2IS:*|*_common_fifo:*dcfifo*rs_dgwp*}]
set_false_path -from [get_registers {*alt_vipcti*_Vid2IS:*|*_common_fifo:*dcfifo*rdptr_g[*]}] -to [get_registers {*alt_vipcti*_Vid2IS:*|*_common_fifo:*dcfifo*ws_dgrp*}]
