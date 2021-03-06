//
//  IconStyleKit.swift
//  KKI
//
//  Created by richayden on 12/2/15.
//  Copyright (c) 2015 richayden. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class IconStyleKit : NSObject {

    //// Cache

    private struct Cache {
        static var imageOfClear: UIImage?
        static var clearTargets: [AnyObject]?
        static var imageOfSelect: UIImage?
        static var selectTargets: [AnyObject]?
        static var imageOfNavBarGradient: UIImage?
        static var navBarGradientTargets: [AnyObject]?
        static var imageOfPreview: UIImage?
        static var previewTargets: [AnyObject]?
        static var imageOfPencil: UIImage?
        static var pencilTargets: [AnyObject]?
        static var imageOfNeuterIcon: UIImage?
        static var neuterIconTargets: [AnyObject]?
        static var imageOfTinyK: UIImage?
        static var tinyKTargets: [AnyObject]?
    }

    //// Drawing Methods

    public class func drawClear() {
        //// Color Declarations
        let siteGreen = UIColor(red: 0.784, green: 0.788, blue: 0.655, alpha: 1.000)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(4.66, 4.66))
        bezierPath.addCurveToPoint(CGPointMake(22.34, 4.66), controlPoint1: CGPointMake(9.54, -0.22), controlPoint2: CGPointMake(17.46, -0.22))
        bezierPath.addCurveToPoint(CGPointMake(22.34, 22.34), controlPoint1: CGPointMake(27.22, 9.54), controlPoint2: CGPointMake(27.22, 17.46))
        bezierPath.addCurveToPoint(CGPointMake(4.66, 22.34), controlPoint1: CGPointMake(17.46, 27.22), controlPoint2: CGPointMake(9.54, 27.22))
        bezierPath.addCurveToPoint(CGPointMake(4.66, 4.66), controlPoint1: CGPointMake(-0.22, 17.46), controlPoint2: CGPointMake(-0.22, 9.54))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(15.09, 13.54))
        bezierPath.addLineToPoint(CGPointMake(20.79, 19.17))
        bezierPath.addCurveToPoint(CGPointMake(21.13, 19.97), controlPoint1: CGPointMake(21.01, 19.38), controlPoint2: CGPointMake(21.13, 19.67))
        bezierPath.addCurveToPoint(CGPointMake(20.79, 20.78), controlPoint1: CGPointMake(21.13, 20.28), controlPoint2: CGPointMake(21.01, 20.57))
        bezierPath.addCurveToPoint(CGPointMake(20.78, 20.8), controlPoint1: CGPointMake(20.79, 20.79), controlPoint2: CGPointMake(20.78, 20.79))
        bezierPath.addCurveToPoint(CGPointMake(19.17, 20.8), controlPoint1: CGPointMake(20.33, 21.24), controlPoint2: CGPointMake(19.61, 21.24))
        bezierPath.addLineToPoint(CGPointMake(13.5, 15.12))
        bezierPath.addLineToPoint(CGPointMake(7.83, 20.79))
        bezierPath.addCurveToPoint(CGPointMake(7.03, 21.13), controlPoint1: CGPointMake(7.62, 21.01), controlPoint2: CGPointMake(7.33, 21.13))
        bezierPath.addCurveToPoint(CGPointMake(6.22, 20.79), controlPoint1: CGPointMake(6.72, 21.13), controlPoint2: CGPointMake(6.43, 21.01))
        bezierPath.addCurveToPoint(CGPointMake(6.2, 20.78), controlPoint1: CGPointMake(6.21, 20.79), controlPoint2: CGPointMake(6.21, 20.78))
        bezierPath.addCurveToPoint(CGPointMake(6.2, 19.17), controlPoint1: CGPointMake(5.76, 20.33), controlPoint2: CGPointMake(5.76, 19.61))
        bezierPath.addLineToPoint(CGPointMake(11.87, 13.5))
        bezierPath.addLineToPoint(CGPointMake(6.22, 7.84))
        bezierPath.addCurveToPoint(CGPointMake(5.88, 7.03), controlPoint1: CGPointMake(6, 7.62), controlPoint2: CGPointMake(5.88, 7.33))
        bezierPath.addCurveToPoint(CGPointMake(6.22, 6.21), controlPoint1: CGPointMake(5.88, 6.72), controlPoint2: CGPointMake(6, 6.43))
        bezierPath.addCurveToPoint(CGPointMake(7.84, 6.21), controlPoint1: CGPointMake(6.66, 5.76), controlPoint2: CGPointMake(7.39, 5.76))
        bezierPath.addLineToPoint(CGPointMake(13.5, 11.87))
        bezierPath.addLineToPoint(CGPointMake(19.16, 6.22))
        bezierPath.addCurveToPoint(CGPointMake(19.97, 5.88), controlPoint1: CGPointMake(19.38, 6), controlPoint2: CGPointMake(19.67, 5.88))
        bezierPath.addCurveToPoint(CGPointMake(20.79, 6.22), controlPoint1: CGPointMake(20.28, 5.88), controlPoint2: CGPointMake(20.57, 6))
        bezierPath.addCurveToPoint(CGPointMake(20.79, 7.84), controlPoint1: CGPointMake(21.24, 6.66), controlPoint2: CGPointMake(21.24, 7.39))
        bezierPath.addLineToPoint(CGPointMake(15.09, 13.54))
        bezierPath.closePath()
        bezierPath.usesEvenOddFillRule = true;

        siteGreen.setFill()
        bezierPath.fill()
    }

    public class func drawSelect() {
        //// Color Declarations
        let siteGreen = UIColor(red: 0.784, green: 0.788, blue: 0.655, alpha: 1.000)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(13.5, 1))
        bezierPath.addCurveToPoint(CGPointMake(26, 13.5), controlPoint1: CGPointMake(20.4, 1), controlPoint2: CGPointMake(26, 6.6))
        bezierPath.addCurveToPoint(CGPointMake(13.5, 26), controlPoint1: CGPointMake(26, 20.4), controlPoint2: CGPointMake(20.4, 26))
        bezierPath.addCurveToPoint(CGPointMake(1, 13.5), controlPoint1: CGPointMake(6.6, 26), controlPoint2: CGPointMake(1, 20.4))
        bezierPath.addCurveToPoint(CGPointMake(13.5, 1), controlPoint1: CGPointMake(1, 6.6), controlPoint2: CGPointMake(6.6, 1))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(11.55, 21.18))
        bezierPath.addCurveToPoint(CGPointMake(11.5, 21.23), controlPoint1: CGPointMake(11.53, 21.19), controlPoint2: CGPointMake(11.52, 21.21))
        bezierPath.addCurveToPoint(CGPointMake(10.69, 21.56), controlPoint1: CGPointMake(11.29, 21.44), controlPoint2: CGPointMake(10.99, 21.56))
        bezierPath.addCurveToPoint(CGPointMake(9.88, 21.23), controlPoint1: CGPointMake(10.39, 21.56), controlPoint2: CGPointMake(10.1, 21.44))
        bezierPath.addCurveToPoint(CGPointMake(5.08, 16.43), controlPoint1: CGPointMake(8.65, 19.99), controlPoint2: CGPointMake(6.31, 17.66))
        bezierPath.addCurveToPoint(CGPointMake(4.74, 15.62), controlPoint1: CGPointMake(4.86, 16.21), controlPoint2: CGPointMake(4.74, 15.92))
        bezierPath.addCurveToPoint(CGPointMake(5.08, 14.81), controlPoint1: CGPointMake(4.74, 15.32), controlPoint2: CGPointMake(4.86, 15.03))
        bezierPath.addCurveToPoint(CGPointMake(5.09, 14.8), controlPoint1: CGPointMake(5.08, 14.81), controlPoint2: CGPointMake(5.09, 14.8))
        bezierPath.addCurveToPoint(CGPointMake(6.7, 14.8), controlPoint1: CGPointMake(5.54, 14.35), controlPoint2: CGPointMake(6.25, 14.35))
        bezierPath.addLineToPoint(CGPointMake(10.62, 18.72))
        bezierPath.addLineToPoint(CGPointMake(19.58, 8.05))
        bezierPath.addCurveToPoint(CGPointMake(21.2, 7.9), controlPoint1: CGPointMake(19.99, 7.56), controlPoint2: CGPointMake(20.71, 7.49))
        bezierPath.addCurveToPoint(CGPointMake(21.61, 8.68), controlPoint1: CGPointMake(21.43, 8.1), controlPoint2: CGPointMake(21.58, 8.38))
        bezierPath.addCurveToPoint(CGPointMake(21.34, 9.52), controlPoint1: CGPointMake(21.63, 8.98), controlPoint2: CGPointMake(21.54, 9.28))
        bezierPath.addCurveToPoint(CGPointMake(11.64, 21.08), controlPoint1: CGPointMake(19.31, 11.94), controlPoint2: CGPointMake(13.66, 18.67))
        bezierPath.addCurveToPoint(CGPointMake(11.55, 21.18), controlPoint1: CGPointMake(11.61, 21.12), controlPoint2: CGPointMake(11.58, 21.15))
        bezierPath.closePath()
        bezierPath.usesEvenOddFillRule = true;

        siteGreen.setFill()
        bezierPath.fill()
    }

    public class func drawNavBarGradient() {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Color Declarations
        let nickelHighlightColor = UIColor(red: 0.949, green: 0.919, blue: 0.830, alpha: 1.000)
        let siteGreen = UIColor(red: 0.784, green: 0.788, blue: 0.655, alpha: 1.000)

        //// Gradient Declarations
        let navBarGrad = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [siteGreen.CGColor, nickelHighlightColor.CGColor], [0, 1])!

        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRectMake(0, 0, 1, 64))
        CGContextSaveGState(context)
        rectanglePath.addClip()
        CGContextDrawLinearGradient(context, navBarGrad, CGPointMake(0.5, -0), CGPointMake(0.5, 64), CGGradientDrawingOptions())
        CGContextRestoreGState(context)
    }

    public class func drawPreview() {
        //// Color Declarations
        let siteGreen = UIColor(red: 0.784, green: 0.788, blue: 0.655, alpha: 1.000)

        //// normal Drawing
        let normalPath = UIBezierPath()
        normalPath.moveToPoint(CGPointMake(1, 13.1))
        normalPath.addCurveToPoint(CGPointMake(19.17, 1), controlPoint1: CGPointMake(1, 13.1), controlPoint2: CGPointMake(6.68, 1))
        normalPath.addCurveToPoint(CGPointMake(38, 13.03), controlPoint1: CGPointMake(31.67, 1), controlPoint2: CGPointMake(38.02, 12.95))
        normalPath.addCurveToPoint(CGPointMake(19.45, 25), controlPoint1: CGPointMake(37.98, 13.12), controlPoint2: CGPointMake(31.76, 25))
        normalPath.addCurveToPoint(CGPointMake(1, 13.1), controlPoint1: CGPointMake(7.14, 25), controlPoint2: CGPointMake(1.03, 14.31))
        normalPath.closePath()
        normalPath.moveToPoint(CGPointMake(19.5, 5.08))
        normalPath.addCurveToPoint(CGPointMake(27.61, 13), controlPoint1: CGPointMake(23.98, 5.08), controlPoint2: CGPointMake(27.61, 8.63))
        normalPath.addCurveToPoint(CGPointMake(19.5, 20.92), controlPoint1: CGPointMake(27.61, 17.37), controlPoint2: CGPointMake(23.98, 20.92))
        normalPath.addCurveToPoint(CGPointMake(11.39, 13), controlPoint1: CGPointMake(15.02, 20.92), controlPoint2: CGPointMake(11.39, 17.37))
        normalPath.addCurveToPoint(CGPointMake(19.5, 5.08), controlPoint1: CGPointMake(11.39, 8.63), controlPoint2: CGPointMake(15.02, 5.08))
        normalPath.closePath()
        normalPath.moveToPoint(CGPointMake(19.5, 8.63))
        normalPath.addCurveToPoint(CGPointMake(23.97, 13), controlPoint1: CGPointMake(21.97, 8.63), controlPoint2: CGPointMake(23.97, 10.59))
        normalPath.addCurveToPoint(CGPointMake(19.5, 17.37), controlPoint1: CGPointMake(23.97, 15.41), controlPoint2: CGPointMake(21.97, 17.37))
        normalPath.addCurveToPoint(CGPointMake(15.03, 13), controlPoint1: CGPointMake(17.03, 17.37), controlPoint2: CGPointMake(15.03, 15.41))
        normalPath.addCurveToPoint(CGPointMake(19.5, 8.63), controlPoint1: CGPointMake(15.03, 10.59), controlPoint2: CGPointMake(17.03, 8.63))
        normalPath.closePath()
        normalPath.usesEvenOddFillRule = true;

        siteGreen.setFill()
        normalPath.fill()
    }

    public class func drawPencil() {
        //// Color Declarations
        let siteGreen = UIColor(red: 0.784, green: 0.788, blue: 0.655, alpha: 1.000)

        //// normal Drawing
        let normalPath = UIBezierPath()
        normalPath.moveToPoint(CGPointMake(15.53, 4.42))
        normalPath.addCurveToPoint(CGPointMake(14.11, 4.44), controlPoint1: CGPointMake(15.53, 4.42), controlPoint2: CGPointMake(14.83, 3.73))
        normalPath.addCurveToPoint(CGPointMake(4.51, 14.17), controlPoint1: CGPointMake(13.39, 5.14), controlPoint2: CGPointMake(4.51, 14.17))
        normalPath.addCurveToPoint(CGPointMake(1.82, 20.61), controlPoint1: CGPointMake(4.51, 14.17), controlPoint2: CGPointMake(2.67, 15.56))
        normalPath.addCurveToPoint(CGPointMake(1.03, 24.99), controlPoint1: CGPointMake(0.97, 25.65), controlPoint2: CGPointMake(1.03, 24.99))
        normalPath.addCurveToPoint(CGPointMake(1.17, 25.83), controlPoint1: CGPointMake(1.03, 24.99), controlPoint2: CGPointMake(0.91, 25.58))
        normalPath.addCurveToPoint(CGPointMake(2, 25.98), controlPoint1: CGPointMake(1.42, 26.08), controlPoint2: CGPointMake(2, 25.98))
        normalPath.addLineToPoint(CGPointMake(5.66, 25.39))
        normalPath.addCurveToPoint(CGPointMake(13.26, 22.15), controlPoint1: CGPointMake(5.66, 25.39), controlPoint2: CGPointMake(10.49, 25.13))
        normalPath.addCurveToPoint(CGPointMake(22.59, 12.79), controlPoint1: CGPointMake(16.02, 19.16), controlPoint2: CGPointMake(22.59, 12.79))
        normalPath.addCurveToPoint(CGPointMake(22.57, 11.55), controlPoint1: CGPointMake(22.59, 12.79), controlPoint2: CGPointMake(23.13, 12.1))
        normalPath.addCurveToPoint(CGPointMake(15.53, 4.42), controlPoint1: CGPointMake(22.01, 11), controlPoint2: CGPointMake(15.53, 4.42))
        normalPath.closePath()
        normalPath.moveToPoint(CGPointMake(4.73, 16.66))
        normalPath.addLineToPoint(CGPointMake(10.42, 22.33))
        normalPath.addCurveToPoint(CGPointMake(7.45, 23.24), controlPoint1: CGPointMake(10.42, 22.33), controlPoint2: CGPointMake(9.27, 22.93))
        normalPath.addCurveToPoint(CGPointMake(5.64, 23.62), controlPoint1: CGPointMake(5.63, 23.54), controlPoint2: CGPointMake(5.64, 23.62))
        normalPath.addLineToPoint(CGPointMake(3.44, 21.4))
        normalPath.addLineToPoint(CGPointMake(3.74, 19.78))
        normalPath.addCurveToPoint(CGPointMake(4.73, 16.66), controlPoint1: CGPointMake(3.74, 19.78), controlPoint2: CGPointMake(4.3, 17.05))
        normalPath.closePath()
        normalPath.moveToPoint(CGPointMake(10.52, 18.57))
        normalPath.addCurveToPoint(CGPointMake(10.57, 19.58), controlPoint1: CGPointMake(10.52, 18.57), controlPoint2: CGPointMake(10.12, 19.18))
        normalPath.addCurveToPoint(CGPointMake(11.55, 19.71), controlPoint1: CGPointMake(11.01, 19.98), controlPoint2: CGPointMake(11.55, 19.71))
        normalPath.addLineToPoint(CGPointMake(19.17, 12.06))
        normalPath.addCurveToPoint(CGPointMake(19.03, 11.05), controlPoint1: CGPointMake(19.17, 12.06), controlPoint2: CGPointMake(19.53, 11.53))
        normalPath.addCurveToPoint(CGPointMake(18.04, 11.02), controlPoint1: CGPointMake(18.53, 10.57), controlPoint2: CGPointMake(18.04, 11.02))
        normalPath.addLineToPoint(CGPointMake(10.52, 18.57))
        normalPath.closePath()
        normalPath.moveToPoint(CGPointMake(7.31, 15.49))
        normalPath.addCurveToPoint(CGPointMake(7.35, 16.51), controlPoint1: CGPointMake(7.31, 15.49), controlPoint2: CGPointMake(6.91, 16.11))
        normalPath.addCurveToPoint(CGPointMake(8.33, 16.63), controlPoint1: CGPointMake(7.79, 16.91), controlPoint2: CGPointMake(8.33, 16.63))
        normalPath.addLineToPoint(CGPointMake(15.96, 8.98))
        normalPath.addCurveToPoint(CGPointMake(15.81, 7.97), controlPoint1: CGPointMake(15.96, 8.98), controlPoint2: CGPointMake(16.31, 8.45))
        normalPath.addCurveToPoint(CGPointMake(14.82, 7.95), controlPoint1: CGPointMake(15.31, 7.5), controlPoint2: CGPointMake(14.82, 7.95))
        normalPath.addLineToPoint(CGPointMake(7.31, 15.49))
        normalPath.closePath()
        normalPath.moveToPoint(CGPointMake(20.24, 6.83))
        normalPath.addLineToPoint(CGPointMake(23.43, 10.05))
        normalPath.addCurveToPoint(CGPointMake(25.04, 9.66), controlPoint1: CGPointMake(23.43, 10.05), controlPoint2: CGPointMake(24.1, 10.97))
        normalPath.addCurveToPoint(CGPointMake(24.47, 2.5), controlPoint1: CGPointMake(25.99, 8.34), controlPoint2: CGPointMake(26.84, 4.89))
        normalPath.addCurveToPoint(CGPointMake(17.2, 2.14), controlPoint1: CGPointMake(22.1, 0.11), controlPoint2: CGPointMake(18.33, 1.03))
        normalPath.addCurveToPoint(CGPointMake(17.12, 3.74), controlPoint1: CGPointMake(16.07, 3.25), controlPoint2: CGPointMake(16.97, 3.55))
        normalPath.addCurveToPoint(CGPointMake(20.24, 6.83), controlPoint1: CGPointMake(17.28, 3.93), controlPoint2: CGPointMake(20.24, 6.83))
        normalPath.closePath()
        normalPath.usesEvenOddFillRule = true;

        siteGreen.setFill()
        normalPath.fill()
    }

    public class func drawNeuterIcon() {
        //// Color Declarations
        let siteGreen = UIColor(red: 0.784, green: 0.788, blue: 0.655, alpha: 1.000)

        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.moveToPoint(CGPointMake(2.26, 9.45))
        bezier5Path.addCurveToPoint(CGPointMake(3.83, 11.13), controlPoint1: CGPointMake(2.26, 10.38), controlPoint2: CGPointMake(2.96, 11.13))
        bezier5Path.addCurveToPoint(CGPointMake(5.4, 9.45), controlPoint1: CGPointMake(4.7, 11.13), controlPoint2: CGPointMake(5.4, 10.38))
        bezier5Path.addCurveToPoint(CGPointMake(3.83, 7.77), controlPoint1: CGPointMake(5.4, 8.52), controlPoint2: CGPointMake(4.7, 7.77))
        bezier5Path.addCurveToPoint(CGPointMake(2.26, 9.45), controlPoint1: CGPointMake(2.96, 7.77), controlPoint2: CGPointMake(2.26, 8.52))
        bezier5Path.closePath()
        bezier5Path.moveToPoint(CGPointMake(1.02, 9.56))
        bezier5Path.addLineToPoint(CGPointMake(1.02, 4.51))
        bezier5Path.addCurveToPoint(CGPointMake(4.35, 1), controlPoint1: CGPointMake(1.02, 4.51), controlPoint2: CGPointMake(1.26, 1))
        bezier5Path.addLineToPoint(CGPointMake(11.09, 1))
        bezier5Path.addCurveToPoint(CGPointMake(14.32, 5.05), controlPoint1: CGPointMake(11.09, 1), controlPoint2: CGPointMake(14.32, 1.14))
        bezier5Path.addCurveToPoint(CGPointMake(14.9, 5.42), controlPoint1: CGPointMake(14.32, 5.05), controlPoint2: CGPointMake(14.4, 5.42))
        bezier5Path.addLineToPoint(CGPointMake(16.77, 5.42))
        bezier5Path.addCurveToPoint(CGPointMake(17.14, 6.05), controlPoint1: CGPointMake(16.77, 5.42), controlPoint2: CGPointMake(17.14, 5.36))
        bezier5Path.addCurveToPoint(CGPointMake(17.65, 6.59), controlPoint1: CGPointMake(17.14, 6.05), controlPoint2: CGPointMake(17.19, 6.59))
        bezier5Path.addLineToPoint(CGPointMake(32.35, 6.59))
        bezier5Path.addCurveToPoint(CGPointMake(33.71, 7.87), controlPoint1: CGPointMake(32.35, 6.59), controlPoint2: CGPointMake(32.83, 6.62))
        bezier5Path.addCurveToPoint(CGPointMake(33.97, 8.59), controlPoint1: CGPointMake(33.71, 7.87), controlPoint2: CGPointMake(33.97, 8.19))
        bezier5Path.addCurveToPoint(CGPointMake(33.12, 9.87), controlPoint1: CGPointMake(33.97, 8.59), controlPoint2: CGPointMake(34.24, 9.04))
        bezier5Path.addCurveToPoint(CGPointMake(31.55, 11.46), controlPoint1: CGPointMake(33.12, 9.87), controlPoint2: CGPointMake(31.87, 11.17))
        bezier5Path.addLineToPoint(CGPointMake(30.54, 10.69))
        bezier5Path.addLineToPoint(CGPointMake(30.03, 10.73))
        bezier5Path.addLineToPoint(CGPointMake(28.88, 12.2))
        bezier5Path.addLineToPoint(CGPointMake(27.59, 12.21))
        bezier5Path.addLineToPoint(CGPointMake(27.07, 12.21))
        bezier5Path.addLineToPoint(CGPointMake(25.74, 10.73))
        bezier5Path.addLineToPoint(CGPointMake(24.99, 10.73))
        bezier5Path.addLineToPoint(CGPointMake(23.59, 12.21))
        bezier5Path.addLineToPoint(CGPointMake(23.04, 12.21))
        bezier5Path.addLineToPoint(CGPointMake(22.63, 12.21))
        bezier5Path.addLineToPoint(CGPointMake(22.33, 12.21))
        bezier5Path.addLineToPoint(CGPointMake(20.93, 10.69))
        bezier5Path.addLineToPoint(CGPointMake(19.89, 10.69))
        bezier5Path.addLineToPoint(CGPointMake(18.54, 12.21))
        bezier5Path.addLineToPoint(CGPointMake(17.54, 12.21))
        bezier5Path.addCurveToPoint(CGPointMake(17.22, 12.64), controlPoint1: CGPointMake(17.54, 12.21), controlPoint2: CGPointMake(17.22, 12.38))
        bezier5Path.addLineToPoint(CGPointMake(17.22, 13.07))
        bezier5Path.addCurveToPoint(CGPointMake(16.74, 13.55), controlPoint1: CGPointMake(17.22, 13.07), controlPoint2: CGPointMake(17.22, 13.55))
        bezier5Path.addLineToPoint(CGPointMake(14.74, 13.55))
        bezier5Path.addCurveToPoint(CGPointMake(14.42, 14.04), controlPoint1: CGPointMake(14.74, 13.55), controlPoint2: CGPointMake(14.42, 13.69))
        bezier5Path.addCurveToPoint(CGPointMake(10.96, 18), controlPoint1: CGPointMake(14.42, 14.04), controlPoint2: CGPointMake(14.64, 18))
        bezier5Path.addLineToPoint(CGPointMake(4.3, 18))
        bezier5Path.addCurveToPoint(CGPointMake(1, 14.43), controlPoint1: CGPointMake(4.3, 18), controlPoint2: CGPointMake(1, 17.83))
        bezier5Path.addLineToPoint(CGPointMake(1.02, 9.56))
        bezier5Path.closePath()
        bezier5Path.miterLimit = 4;

        siteGreen.setFill()
        bezier5Path.fill()
    }

    public class func drawTinyK() {
        //// Color Declarations
        let siteGreen = UIColor(red: 0.784, green: 0.788, blue: 0.655, alpha: 1.000)

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(19.17, 5.4))
        bezierPath.addLineToPoint(CGPointMake(14.24, 5.4))
        bezierPath.addLineToPoint(CGPointMake(9.55, 11.82))
        bezierPath.addLineToPoint(CGPointMake(9.45, 10.83))
        bezierPath.addCurveToPoint(CGPointMake(10.73, 8.39), controlPoint1: CGPointMake(10.22, 10.29), controlPoint2: CGPointMake(10.73, 9.4))
        bezierPath.addCurveToPoint(CGPointMake(7.78, 5.43), controlPoint1: CGPointMake(10.73, 6.76), controlPoint2: CGPointMake(9.41, 5.43))
        bezierPath.addCurveToPoint(CGPointMake(4.83, 8.39), controlPoint1: CGPointMake(6.15, 5.43), controlPoint2: CGPointMake(4.83, 6.76))
        bezierPath.addCurveToPoint(CGPointMake(5.76, 10.54), controlPoint1: CGPointMake(4.83, 9.24), controlPoint2: CGPointMake(5.19, 10))
        bezierPath.addLineToPoint(CGPointMake(4.93, 18.69))
        bezierPath.addLineToPoint(CGPointMake(10.25, 18.69))
        bezierPath.addLineToPoint(CGPointMake(9.69, 13.18))
        bezierPath.addLineToPoint(CGPointMake(13.86, 18.69))
        bezierPath.addLineToPoint(CGPointMake(19.17, 18.69))
        bezierPath.addLineToPoint(CGPointMake(13.86, 12.04))
        bezierPath.addLineToPoint(CGPointMake(19.17, 5.4))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(1, 12))
        bezierPath.addCurveToPoint(CGPointMake(12, 1), controlPoint1: CGPointMake(1, 5.92), controlPoint2: CGPointMake(5.92, 1))
        bezierPath.addCurveToPoint(CGPointMake(23, 12), controlPoint1: CGPointMake(18.08, 1), controlPoint2: CGPointMake(23, 5.92))
        bezierPath.addCurveToPoint(CGPointMake(12, 23), controlPoint1: CGPointMake(23, 18.08), controlPoint2: CGPointMake(18.08, 23))
        bezierPath.addCurveToPoint(CGPointMake(1, 12), controlPoint1: CGPointMake(5.92, 23), controlPoint2: CGPointMake(1, 18.08))
        bezierPath.closePath()
        siteGreen.setFill()
        bezierPath.fill()
    }

    //// Generated Images

    public class var imageOfClear: UIImage {
        if Cache.imageOfClear != nil {
            return Cache.imageOfClear!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(27, 27), false, 0)
            IconStyleKit.drawClear()

        Cache.imageOfClear = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return Cache.imageOfClear!
    }

    public class var imageOfSelect: UIImage {
        if Cache.imageOfSelect != nil {
            return Cache.imageOfSelect!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(27, 27), false, 0)
            IconStyleKit.drawSelect()

        Cache.imageOfSelect = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return Cache.imageOfSelect!
    }

    public class var imageOfNavBarGradient: UIImage {
        if Cache.imageOfNavBarGradient != nil {
            return Cache.imageOfNavBarGradient!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 64), false, 0)
            IconStyleKit.drawNavBarGradient()

        Cache.imageOfNavBarGradient = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return Cache.imageOfNavBarGradient!
    }

    public class var imageOfPreview: UIImage {
        if Cache.imageOfPreview != nil {
            return Cache.imageOfPreview!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(39, 26), false, 0)
            IconStyleKit.drawPreview()

        Cache.imageOfPreview = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return Cache.imageOfPreview!
    }

    public class var imageOfPencil: UIImage {
        if Cache.imageOfPencil != nil {
            return Cache.imageOfPencil!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(27, 27), false, 0)
            IconStyleKit.drawPencil()

        Cache.imageOfPencil = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return Cache.imageOfPencil!
    }

    public class var imageOfNeuterIcon: UIImage {
        if Cache.imageOfNeuterIcon != nil {
            return Cache.imageOfNeuterIcon!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(35, 19), false, 0)
            IconStyleKit.drawNeuterIcon()

        Cache.imageOfNeuterIcon = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return Cache.imageOfNeuterIcon!
    }

    public class var imageOfTinyK: UIImage {
        if Cache.imageOfTinyK != nil {
            return Cache.imageOfTinyK!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(24, 24), false, 0)
            IconStyleKit.drawTinyK()

        Cache.imageOfTinyK = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return Cache.imageOfTinyK!
    }

    //// Customization Infrastructure

    @IBOutlet var clearTargets: [AnyObject]! {
        get { return Cache.clearTargets }
        set {
            Cache.clearTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: IconStyleKit.imageOfClear)
            }
        }
    }

    @IBOutlet var selectTargets: [AnyObject]! {
        get { return Cache.selectTargets }
        set {
            Cache.selectTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: IconStyleKit.imageOfSelect)
            }
        }
    }

    @IBOutlet var navBarGradientTargets: [AnyObject]! {
        get { return Cache.navBarGradientTargets }
        set {
            Cache.navBarGradientTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: IconStyleKit.imageOfNavBarGradient)
            }
        }
    }

    @IBOutlet var previewTargets: [AnyObject]! {
        get { return Cache.previewTargets }
        set {
            Cache.previewTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: IconStyleKit.imageOfPreview)
            }
        }
    }

    @IBOutlet var pencilTargets: [AnyObject]! {
        get { return Cache.pencilTargets }
        set {
            Cache.pencilTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: IconStyleKit.imageOfPencil)
            }
        }
    }

    @IBOutlet var neuterIconTargets: [AnyObject]! {
        get { return Cache.neuterIconTargets }
        set {
            Cache.neuterIconTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: IconStyleKit.imageOfNeuterIcon)
            }
        }
    }

    @IBOutlet var tinyKTargets: [AnyObject]! {
        get { return Cache.tinyKTargets }
        set {
            Cache.tinyKTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector("setImage:", withObject: IconStyleKit.imageOfTinyK)
            }
        }
    }

}
