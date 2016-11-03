package JsfClass;


import javax.annotation.PostConstruct;
import java.io.Serializable;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;

import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.PieChartModel;

@ManagedBean
public class ChartView implements Serializable {

    private BarChartModel barModel;
    
    private PieChartModel messagesModel;
    private PieChartModel documentModel;

    public PieChartModel getMessagesModel() {
        return messagesModel;
    }

    public PieChartModel getDocumentModel() {
        return documentModel;
    }
    
    @PostConstruct
    public void init() {
        createBarModels();
        createPieModels();
    }

    private void createPieModels() {
        createMessagesModel();
        createDocumentModel();
    }

    private void createMessagesModel() {
        messagesModel = new PieChartModel();
        messagesModel.set("خوانده شده", 200);
        messagesModel.set("خوانده نشده", 350);

        messagesModel.setTitle("وضعیت پیام ها تعداد "+255);
        messagesModel.setLegendPosition("w");
    }
    
    private void createDocumentModel() {
        
        documentModel = new PieChartModel();
        documentModel.set("مدارک تائید شده", 16);
        documentModel.set("مدارک تائید نشده", 17);

        documentModel.setTitle("وضعیت مدارک ارسال شده تعداد "+33);
        documentModel.setLegendPosition("w");
    }

    private BarChartModel initBarModel() {
        BarChartModel model = new BarChartModel();
        int count = 220;
        Long active = Long.valueOf(350),
                activeZo=Long.valueOf(350),
                activeStockTh = Long.valueOf(350),
                activeStockBid = Long.valueOf(350),
                cancelationStoke = Long.valueOf(350),
                cancelationUntitled = Long.valueOf(350)
                ,untitled = Long.valueOf(350);
        
        ChartSeries activeChart = new ChartSeries();
        activeChart.setLabel(
                Integer.valueOf(String.valueOf(Math.round(Float.valueOf(active) / Float.valueOf(count) * 100)))+"% ("+
                "فعال تعداد "+active+")");
        activeChart.set("فعال تعداد "+active, Math.log10(active));
        
        ChartSeries activeZoChart = new ChartSeries();
        activeZoChart.setLabel(
                Integer.valueOf(String.valueOf(Math.round(Float.valueOf(activeZo) / Float.valueOf(count) * 100)))+"% ("+
                "فعال موجود نزد هیئت مدیره تعداد  "+activeZo+")");
        activeZoChart.set("فعال موجود نزد هیئت مدیره", Math.log10(activeZo));
        
        ChartSeries activeStockThChart = new ChartSeries();
        activeStockThChart.setLabel(
                Integer.valueOf(String.valueOf(Math.round(Float.valueOf(activeStockTh) / Float.valueOf(count) * 100)))+"% ("+
                "فعال موجود در تهران تعداد "+activeStockTh+")");
        activeStockThChart.set("فعال موجود در تهران", Math.log10(cancelationStoke));
        
        ChartSeries activeStockBidChart = new ChartSeries();
        activeStockBidChart.setLabel(
                Integer.valueOf(String.valueOf(Math.round(Float.valueOf(activeStockBid) / Float.valueOf(count) * 100)))+"% ("+
                "فعال موجود در کارخانه تعداد "+activeStockBid+")");
        activeStockBidChart.set("فعال موجود در کارخانه", Math.log10(activeStockBid));
        
        ChartSeries cancelationStokeChart = new ChartSeries();
        cancelationStokeChart.setLabel(
                Integer.valueOf(String.valueOf(Math.round(Float.valueOf(cancelationStoke) / Float.valueOf(count) * 100)))+"% ("+
                "ابطالی برگه موجود تعداد "+cancelationStoke+")");
        cancelationStokeChart.set("ابطالی برگه موجود", Math.log10(cancelationStoke));
        
        ChartSeries cancelationUntitedChart = new ChartSeries();
        cancelationUntitedChart.setLabel(
                Integer.valueOf(String.valueOf(Math.round(Float.valueOf(cancelationUntitled) / Float.valueOf(count) * 100)))+"% ("+
                "ابطالی برگه ناموجود تعداد "+cancelationUntitled+")");
        cancelationUntitedChart.set("ابطالی برگه ناموجود", Math.log10(cancelationUntitled));
        
        ChartSeries untitledChart = new ChartSeries();
        untitledChart.setLabel(
                Integer.valueOf(String.valueOf(Math.round(Float.valueOf(untitled) / Float.valueOf(count) * 100)))+"% ("+
                "نامشخص تعداد "+untitled+")");
        untitledChart.set("نامشخص", Math.log10(untitled));

        model.addSeries(activeChart);
        model.addSeries(activeZoChart);
        model.addSeries(activeStockBidChart);
        model.addSeries(activeStockThChart);
        model.addSeries(cancelationStokeChart);
        model.addSeries(cancelationUntitedChart);
        model.addSeries(untitledChart);
        model.setZoom(true);
        model.setAnimate(true);
        return model;
    }

    private void createBarModels() {
        createBarModel();
    }

    public BarChartModel getBarModel() {
        return barModel;
    }

    private void createBarModel() {
        barModel = initBarModel();

        barModel.setTitle("وضعیت سهام ها");
        barModel.setLegendPosition("ne");
        
        Axis xAxis = barModel.getAxis(AxisType.X);
        xAxis.setLabel("مقدار به صورت لگاریتم می باشد");

        Axis yAxis = barModel.getAxis(AxisType.Y);
        //yAxis.setLabel("وضعیت سهام");
        yAxis.setMin(0);
        yAxis.setMax(8);
    }

}
