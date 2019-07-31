function Downsampled_TS = downsampling(TS,Exp_Timestamp,Imaging_Timestamp)

% Test
% TS = Speed;
% Exp_Timestamp = Scaled_Raw_Timestamp;
Downsampled_TS = [];
% Downsampled_TS(:,1) = Imaging_Timestamp;
Nframes = length(Imaging_Timestamp);
% Downsampled_TS(1,1) = 1;
for(i=1:Nframes)
    if(i==1)
        Time_range = [0, mean([Imaging_Timestamp(1,1), Imaging_Timestamp(2,1)])];
    elseif(i==Nframes)
        Time_range = [mean([Imaging_Timestamp(i-1,1),Imaging_Timestamp(i,1)]), Imaging_Timestamp(end)];
    else        
        Time_range = [mean([Imaging_Timestamp(i-1,1), Imaging_Timestamp(i,1)]) mean([Imaging_Timestamp(i,1), Imaging_Timestamp(i+1,1)])];
    end
        ROI_frames = find(Exp_Timestamp>=Time_range(1) & Exp_Timestamp<Time_range(2));
        ROI_frames(find(ROI_frames>size(TS,1))) = [];
        Downsampled_TS(i,1) = nanmean(TS(ROI_frames),1);    
end
