/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Login;

import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/captcha", name = "captchaServlet")
public class Captcha extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int width = 250;
        int height = 100;
        char data[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".toCharArray();
        BufferedImage bufferImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = bufferImage.createGraphics();
        Font font = new Font("Georgia", Font.BOLD, 58);
        g2d.setFont(font);
        RenderingHints rh = new RenderingHints(RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);
        rh.put(RenderingHints.KEY_RENDERING,
                RenderingHints.VALUE_RENDER_QUALITY);
        g2d.setRenderingHints(rh);
        GradientPaint paint = new GradientPaint(0, 0,
                new Color(182, 223, 236), 0, height / 2, new Color(162, 226, 245), true);
        g2d.setPaint(paint);
        g2d.fillRect(0, 0, width, height);
        g2d.setColor(new Color(255, 255, 255));
        char[] temp = new char[5];
        Random r = new Random();
        for (int i = 0; i < temp.length; i++) {
            temp[i] = data[Math.abs(r.nextInt()) % 36];
        }
        String captcha = String.copyValueOf(temp);
        request.getSession().setAttribute("captcha", captcha);
        int x = -15;
        int y = 0;

        for (int i = 0; i < temp.length; i++) {
            x += 30 + (Math.abs(r.nextInt()) % 20);
            y = 50 + Math.abs(r.nextInt()) % 20;
            g2d.drawChars(temp, i, 1, x, y);
        }
        g2d.dispose();
        System.out.println("dddddddddddddddddddddddddddddddddd");
        response.setContentType("image/png");
        OutputStream os = response.getOutputStream();
        ImageIO.write(bufferImage, "png", os);
        os.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processRequest(request, response);
    }

}
